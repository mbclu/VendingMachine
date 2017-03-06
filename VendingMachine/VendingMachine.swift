//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by Mitch Clutter on 2/12/17.
//  Copyright © 2017 Mitch Clutter. All rights reserved.
//

import Foundation

protocol VendingMachine {
    func display() -> String
    func coinReturn() -> [Coin]
    func insert(_ coin: Coin)
    func dispense(_ product: Product)
}

class VendingMachine_Impl : VendingMachine {
    var displayText: String!
    var totalInserted = 0.0
    var coinsReturned = [Coin]()

    init(displayText: String = "INSERT COIN") {
        self.displayText = displayText
    }
    
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
            accumulate(coin.value)
        }
    }
    
    func dispense(_ product: Product) {
        if totalInserted == product.price {
            displayText = "THANK YOU"
            totalInserted = 0.0
        } else {
            displayText = "PRICE " + dollarFormatFor(product.price)
        }
    }
    
    fileprivate func accumulate(_ value: Double) {
        totalInserted += value;
        updateDisplay()
    }
    
    fileprivate func updateDisplay() {
        if (totalInserted > 0.0) {
            displayText = dollarFormatFor(totalInserted)
        }
    }
    
    fileprivate func dollarFormatFor(_ value: Double) -> String {
        return "$ \(String(format: "%.2f", value))"
    }
}
