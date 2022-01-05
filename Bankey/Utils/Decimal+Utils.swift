//
//  Decimal+Utils.swift
//  Bankey
//
//  Created by Boris Bolshakov on 4.01.22.
//

import Foundation

extension Decimal {
    var doubleValue: Double {
        return NSDecimalNumber(decimal:self).doubleValue
    }
}
