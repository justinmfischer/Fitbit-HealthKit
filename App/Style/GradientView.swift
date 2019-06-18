//
//  GradientView.swift
//  Health-Importer
//
//  Created by Justin Fischer on 6/18/19.
//  Copyright © 2019 Justin Fischer. All rights reserved.
//

import UIKit

@IBDesignable
class GradientView: UIView {
    @IBInspectable var firstColor: UIColor = UIColor.clear {
        didSet {
            updateView()
        }
    }
    @IBInspectable var secondColor: UIColor = UIColor.clear {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        guard let layer = self.layer as? CAGradientLayer else { return }
        layer.colors = [firstColor, secondColor].map{$0.cgColor}
    }
    
    override class var layerClass: AnyClass {
        get {
            return CAGradientLayer.self
        }
    }
}
