//
//  Date+Ext.swift
//  GitHubApplication
//
//  Created by Stanly Shiyanovskiy on 11.03.2020.
//  Copyright © 2020 Stanly Shiyanovskiy. All rights reserved.
//

import Foundation

extension Date {
    
    func convertToMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy"
        
        return dateFormatter.string(from: self)
    }
}
