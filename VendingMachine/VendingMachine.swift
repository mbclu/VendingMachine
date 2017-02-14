//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by Mitch Clutter on 2/12/17.
//  Copyright © 2017 Mitch Clutter. All rights reserved.
//

import Foundation

class VendingMachine {
    
    var displayText = "INSERT COIN"
    var totalInserted = 0.0
    var coinsReturned = [Coin]()

    func display() -> String {
        return displayText
    }
    
    func coinReturn() -> [Coin] {
        return coinsReturned
    }
    
    func insert(_ coin: Coin) {
        switch coin {
        case .penny:
            coinsReturned.append(coin)
        default:
            totalInserted += coin.value;
            if (totalInserted > 0.0) {
                displayText = "$ \(String(format: "%.2f", totalInserted))"
            }
        }
    }
}
