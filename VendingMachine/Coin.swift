//
//  Coin.swift
//  VendingMachine
//
//  Created by Mitch Clutter on 2/13/17.
//  Copyright © 2017 Mitch Clutter. All rights reserved.
//

import Foundation

enum Coin {
    case quarter, dime
    var value: Double {
        switch self {
            case .dime: return 0.10
            default:    return 0.25
        }
    }
}
