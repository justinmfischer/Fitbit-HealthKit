//
//  HealthManager.swift
//  Health-Importer
//
//  Created by Justin Fischer on 6/18/19.
//  Copyright © 2019 Justin Fischer. All rights reserved.
//

import HealthKit

class HealthManager {
    public let healthStore = HKHealthStore()
    
    let bodyMassQuantityTypeId = HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.bodyMass)!
    let bodyMassIndexQuantityTypeId = HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.bodyMassIndex)!
    let bodyQuantityFatPercentageQuantityTypeId = HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.bodyFatPercentage)!
    
    public func requestPermissions(completion: @escaping (Result<Bool, Error>) -> ()) {
        let bodyMeasurements: Set = [bodyMassQuantityTypeId, bodyMassIndexQuantityTypeId, bodyQuantityFatPercentageQuantityTypeId]
        
        //Background Thread
        healthStore.requestAuthorization(toShare: bodyMeasurements, read: nil, completion: { (success, error) in
            
            //Main Thread
            DispatchQueue.main.async {
                if success {
                    completion(.success(true))
                } else {
                    completion(.failure(error ?? NSError(domain:"com.health-importer", code:-1, userInfo:nil)))
                }
            }
        })
    }
    
    public func saveBodyMeasurements(mass: Double, massIndex: Double, fatPercentage: Double, date: Date, completion: @escaping (Result<Bool, Error>) -> ()) {
        let mass = HKQuantitySample (type: bodyMassQuantityTypeId,
                                     quantity: HKQuantity.init(unit: HKUnit.pound(), doubleValue: mass),
                                         start: date,
                                         end: date)

        let massIndex = HKQuantitySample (type: bodyMassIndexQuantityTypeId,
                                         quantity: HKQuantity.init(unit: HKUnit.count(), doubleValue: massIndex),
                                         start: date,
                                         end: date)
        
        let fatPercentage = HKQuantitySample (type: bodyQuantityFatPercentageQuantityTypeId,
                                              quantity: HKQuantity.init(unit: HKUnit.percent(), doubleValue: fatPercentage / 100),
                                              start: date,
                                              end: date)
        
        //Background Thread
        healthStore.save([mass, massIndex, fatPercentage]) { success, error in
            
            //Main Thread
            DispatchQueue.main.async {
                if success {
                    completion(.success(true))
                } else {
                    completion(.failure(error ?? NSError(domain:"com.health-importer", code:-1, userInfo:nil)))
                }
            }
        }
    }
}
