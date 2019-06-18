//
//  UIView+Mask.swift
//  Health-Importer
//
//  Created by Justin Fischer on 6/18/19.
//  Copyright © 2019 Justin Fischer. All rights reserved.
//

import UIKit

extension UIView {
    func maskWithCircle(color: UIColor) {
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let radius = min(bounds.width, bounds.height) / 2
        let startAngle = CGFloat(-Double.pi)
        let endAngle = startAngle + CGFloat(Double.pi * 2)
        let path = UIBezierPath(arcCenter: CGPoint.zero, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        let mask = CAShapeLayer()
            mask.path = path.cgPath
            mask.position = center
            mask.fillColor = UIColor.clear.cgColor
            mask.strokeColor = color.cgColor
            mask.lineWidth = 2
        
        self.layer.mask = mask
        self.layer.addSublayer(mask)
    }
}
