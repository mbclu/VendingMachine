//
//  VendingMachineTests.swift
//  VendingMachineTests
//
//  Created by Mitch Clutter on 2/12/17.
//  Copyright © 2017 Mitch Clutter. All rights reserved.
//

import XCTest
import Nimble
@testable import VendingMachine

class VendingMachineTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testItDisplays_INSERT_COIN_WhenEmpty() {
        let underTest = VendingMachine()
        expect(underTest.display()).to(equal("INSERT COIN"))
    }
    
    func testInsertingAQuarterDisplaysTwentyFiveCents() {
        let underTest = VendingMachine()
        underTest.insert(Coin.quarter)
        expect(underTest.display()).to(equal("$ 0.25"))
    }
    
    func testInsertingADimeDisplaysTenCents() {
        let underTest = VendingMachine()
        underTest.insert(Coin.dime)
        expect(underTest.display()).to(equal("$ 0.10"))
    }
    
}
