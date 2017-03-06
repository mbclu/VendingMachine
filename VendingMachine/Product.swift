//
//  Product.swift
//  VendingMachine
//
//  Created by Mitch Clutter on 3/5/17.
//  Copyright © 2017 Mitch Clutter. All rights reserved.
//

import Foundation
enum Product {
    case cola, chips, candy
    var price: Double {
        switch self {
            case .cola:     return 1.00
            case .chips:    return 0.50
            case .candy:    return 0.65
        }
    }
}
