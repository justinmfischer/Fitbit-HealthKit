//
//  String+Date.swift
//  Health-Importer
//
//  Created by Justin Fischer on 6/18/19.
//  Copyright © 2019 Justin Fischer. All rights reserved.
//

import Foundation

extension String {
    func toDate(withFormat format: String = "MM/dd/yy HH:mm:ss") -> Date {
        let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = format
        
        guard let date = dateFormatter.date(from: self) else {
            preconditionFailure("Date/Time Format Error")
        }
        
        return date
    }
}
