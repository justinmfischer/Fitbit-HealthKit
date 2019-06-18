//
//  ViewController.swift
//  Health-Importer
//
//  Created by Justin Fischer on 6/18/19.
//  Copyright © 2019 Justin Fischer. All rights reserved.
//

import UIKit
import HealthKit

class ViewController: UIViewController {
    @IBOutlet weak var progress: UIProgressView!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var source: UILabel!
    
    let health = HealthManager()
    let fileName = "fitbit-data"
    let fileExtension = "csv"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.source.text = "Data Source: \(self.fileName).\(self.fileExtension)"
    }
    
    @IBAction func importHealthData(_ sender: Any) {
        guard HKHealthStore.isHealthDataAvailable() else {
            self.status.text = "HealthKit Unavailable Error"
            
            return
        }
            
        self.health.requestPermissions { (result) in
            switch result {
                case .success(_):
                    self.status.text = "HealthKit Authorization Complete"
                
                    if let resource = Bundle.main.path(forResource: self.fileName, ofType: self.fileExtension) {
                        do {
                            let csv = try CSV(name: resource)
                                self.enumerateHealth(items: csv)
                        } catch {
                            self.status.text = "File Parsing Error"
                        }
                    } else {
                        self.status.text = "File Error"
                    }
                case .failure(let error):
                    self.status.text = "HealthKit Authorization Error: \(String(describing: error.localizedDescription))"
            }
        }
    }
    
    func enumerateHealth(items: CSV) {
        let count = items.namedRows.count
        print("Total Items Found: \(count)")
        
        var itemCount = 0
        
        items.enumerateAsArray { (item) in
            let mass = Double(item[0]) ?? 0.0
            let massIndex = Double(item[1]) ?? 0.0
            let fatPercentage = Double(item[2]) ?? 0.0
            let date = item[3].toDate()
            
            self.health.saveBodyMeasurements(mass: mass, massIndex: massIndex, fatPercentage: fatPercentage, date: date, completion: { (result) in
                itemCount += 1
                
                switch result {
                    case .success(_):
                        self.progress.progress = Float(itemCount) / Float(count)
                        self.status.text = "\(itemCount) of \(count)"
                        
                        print("Item Read: \(mass), \(massIndex), \(fatPercentage), \(item[3])")
                    
                        if itemCount == count {
                            self.displayComplete()
                        }
                    case .failure(let error):
                        print("HealthKit Authorization Error: \(String(describing: error.localizedDescription))")
                }
            })
        }
    }
    
    func displayComplete() {
        let alert = UIAlertController(title: "Complete", message: "Health Import Successful", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                self.reset()
            }))
        self.present(alert, animated: true)
    }
    
    func reset() {
        self.progress.progress = 0.0
        self.status.text = ""
    }
}
