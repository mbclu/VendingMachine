//
//  FakeVendingMachine.swift
//  VendingMachine
//
//  Created by Mitch Clutter on 3/5/17.
//  Copyright © 2017 Mitch Clutter. All rights reserved.
//

import Foundation
@testable import VendingMachine

class FakeVendingMachine: VendingMachine {
    var dispenseCount: [Product: Int]
    var displayText: String
    
    init() {
        displayText = "Booting up vending machine!"
        dispenseCount = [
            Product.cola: 0,
            Product.chips: 0,
            Product.candy: 0,
        ]
    }
    
    func display() -> String {
        return displayText
    }
    
    func coinReturn() -> [Coin] {
        return []
    }
    
    func insert(_ coin: Coin) {
        
    }
    
    func dispense(_ product: Product) {
        dispenseCount[product] = dispenseCount[product]! + 1
        displayText = "About to dispense: \(product)"
    }
    
    func didAttemptToDispense(product: Product) -> Bool {
        return dispenseCount[product]! > 0
    }
}
