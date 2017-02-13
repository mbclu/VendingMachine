//
//  Coin.swift
//  VendingMachine
//
//  Created by Mitch Clutter on 2/13/17.
//  Copyright © 2017 Mitch Clutter. All rights reserved.
//

import Foundation

enum Coin {
    case quarter, dime, nickel, penny
    var value: Double {
        switch self {
            case .nickel:   return 0.05
            case .dime:     return 0.10
            case .quarter:  return 0.25
            default:        return 0.00
        }
    }
}
