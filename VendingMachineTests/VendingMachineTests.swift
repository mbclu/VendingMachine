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
        underTest = VendingMachine_Impl()
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

    func testInsertingANickelDisplaysFiveCents() {
        underTest.insert(Coin.nickel)
        expect(self.underTest.display()).to(equal("$ 0.05"))
    }
    
    func testInsertingAPennyStillDisplays_INSERT_COIN() {
        underTest.insert(Coin.penny)
        expect(self.underTest.display()).to(equal("INSERT COIN"))
    }
    
    func testInsertingMultipleValidCoinsDisplaysTheSum() {
        underTest.insert(Coin.quarter)
        underTest.insert(Coin.dime)
        expect(self.underTest.display()).to(equal("$ 0.35"))
    }
    
    func testInsertingAPennyResultsInAPennyInTheCoinReturn() {
        underTest.insert(Coin.penny)
        expect(self.underTest.coinReturn()).to(equal([Coin.penny]))
    }
}
