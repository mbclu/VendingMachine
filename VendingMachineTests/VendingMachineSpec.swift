//
//  VendingMachineSpec.swift
//  VendingMachine
//
//  Created by Mitch Clutter on 2/18/17.
//  Copyright © 2017 Mitch Clutter. All rights reserved.
//

import Quick
import Nimble
@testable import VendingMachine

class VendingMachineSpec : QuickSpec {
    override func spec() {
        var subject:VendingMachineViewController!
//        let vendingMachine = VendingMachine_Impl()
        
        beforeEach {
            super.setUp()
            
            let storyboard = UIStoryboard(name    : "Main", bundle: nil)
            subject = storyboard.instantiateInitialViewController() as! VendingMachineViewController
        }
        
        describe("Vending Machine when loaded from storyboard") {
            it("has a non nil vendingMachine object") {
                expect(subject.vendingMachine).notTo(beNil())
            }
        }
        
        describe("The LCD Display") {
            it("displays initial value of the vendingMachine when no coins have been inserted") {
                let expected = "Hello World"
                let vendingMachine = VendingMachine_Impl(displayText: expected)
                subject.vendingMachine = vendingMachine
                expect(subject.view).toNot(beNil())
                expect(subject.lcd.text).to(equal(expected))
            }
            
            it("displays the new value when a coin is inserted") {
                
            }
        }
    }
}
