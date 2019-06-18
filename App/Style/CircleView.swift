//
//  CircleView.swift
//  Health-Importer
//
//  Created by Justin Fischer on 6/18/19.
//  Copyright © 2019 Justin Fischer. All rights reserved.
//

import UIKit

@IBDesignable
class CircleView: UIView {
    @IBInspectable var color: UIColor = UIColor.black {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        self.maskWithCircle(color: color)
    }
}
