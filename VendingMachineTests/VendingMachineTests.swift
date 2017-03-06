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
    var underTest:VendingMachine_Impl!
    
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
    
    func testDispensingColaWhenNothingInsertedDisplays_PRICE_$1_00() {
        underTest.dispense(Product.cola)
        
        expect(self.underTest.display()).to(equal("PRICE $ 1.00"))
    }
    
    func testDispensingChipsWhenNothingInsertedDisplays_PRICE_$0_50() {
        underTest.dispense(Product.chips)
        
        expect(self.underTest.display()).to(equal("PRICE $ 0.50"))
    }
    
    func testDispensingCandyWhenNothingInsertedDisplays_PRICE_$0_65() {
        underTest.dispense(Product.candy)
        
        expect(self.underTest.display()).to(equal("PRICE $ 0.65"))
    }
    
    func testDisplayWillSay_THANK_YOU_whenEnoughHasBeenInsertedForProduct() {
        underTest.insert(Coin.quarter)
        underTest.insert(Coin.quarter)
        
        underTest.dispense(Product.chips)
        
        expect(self.underTest.display()).to(equal("THANK YOU"))
    }
    
    func testWhenProductIsDispensedThenAmountInsertedIsReducedToZero() {
        underTest.insert(Coin.quarter)
        underTest.insert(Coin.quarter)
        underTest.insert(Coin.dime)
        underTest.insert(Coin.nickel)
        
        underTest.dispense(Product.candy)
        
        expect(self.underTest.totalInserted).to(equal(0.0))
    }
    
    func testWhenTooLittleHasBeenInsertedAndProductDispenseIsAttemptedThenTheAmountInsertedRemainsTheSame() {
        underTest.insert(Coin.quarter)
        underTest.insert(Coin.quarter)
        
        underTest.dispense(Product.candy)
        
        expect(self.underTest.totalInserted).to(equal(0.50))
    }
}
