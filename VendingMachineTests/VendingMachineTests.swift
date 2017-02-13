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
    var underTest:VendingMachine!
    
    override func setUp() {
        super.setUp()
        underTest = VendingMachine()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testItDisplays_INSERT_COIN_WhenEmpty() {
        expect(self.underTest.display()).to(equal("INSERT COIN"))
    }
    
    func testInsertingAQuarterDisplaysTwentyFiveCents() {
        underTest.insert(Coin.quarter)
        expect(self.underTest.display()).to(equal("$ 0.25"))
    }
    
    func testInsertingADimeDisplaysTenCents() {
        underTest.insert(Coin.dime)
        expect(self.underTest.display()).to(equal("$ 0.10"))
    }
    
}
