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

    func display() -> String {
        return displayText
    }
    
    func insert(_ coin: Coin) {
        displayText = "$ 0.25"
    }
}
