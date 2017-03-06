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
                
                subject.vendingMachine = VendingMachine_Impl(displayText: expected)
                
                _ = subject.view
                expect(subject.lcd.text).to(equal(expected))
            }
            
            it("displays the new value when a coin is inserted") {
                let expected = "$ 0.25"
                
                subject.vendingMachine = VendingMachine_Impl()
                subject.vendingMachine.insert(Coin.quarter)
                
                _ = subject.view
                expect(subject.lcd.text).to(equal(expected))
            }
            
            describe("Product selection") {
                beforeEach {
                    subject.vendingMachine = FakeVendingMachine()
                    _ = subject.view
                }
                
                it("attempts to dispense cola (product 0) when cola button is pressed") {
                    let fvm = subject.vendingMachine as! FakeVendingMachine
                    
                    expect(fvm.didAttemptToDispense(product: .cola)).to(beFalse())
                    
                    subject.colaButton.sendActions(for: UIControlEvents.touchUpInside)
                    
                    expect(fvm.didAttemptToDispense(product: .cola)).to(beTrue())
                }
                
                it("attempts to dispense chips (product 1) when chips button is pressed") {
                    let fvm = subject.vendingMachine as! FakeVendingMachine
                    
                    expect(fvm.didAttemptToDispense(product: .chips)).to(beFalse())
                    
                    subject.chipsButton.sendActions(for: UIControlEvents.touchUpInside)
                    
                    expect(fvm.didAttemptToDispense(product: .chips)).to(beTrue())
                }
                
                it("attempts to dispense candy (product 2) when candy button is pressed") {
                    let fvm = subject.vendingMachine as! FakeVendingMachine
                    
                    expect(fvm.didAttemptToDispense(product: .candy)).to(beFalse())
                    
                    subject.candyButton.sendActions(for: UIControlEvents.touchUpInside)
                    
                    expect(fvm.didAttemptToDispense(product: .candy)).to(beTrue())
                }
                
                it("updates the display when a product is selected") {
                    subject.candyButton.sendActions(for: UIControlEvents.touchUpInside)
                    
                    expect(subject.lcd.text).to(equal("About to dispense: candy"))
                }
            }
        }
        
        describe("Button styles") {
            beforeEach {
                expect(subject.view).toNot(beNil())
            }
            
            it("has rounded corners for the cola button") {
                expect(subject.colaButton.layer.cornerRadius).to(equal(10.0))
                expect(subject.colaButton.clipsToBounds).to(beTrue())
            }
            
            it("has rounded corners for the chips button") {
                expect(subject.chipsButton.layer.cornerRadius).to(equal(10.0))
                expect(subject.chipsButton.clipsToBounds).to(beTrue())
            }
            
            it("has rounded corners for the candy button") {
                expect(subject.candyButton.layer.cornerRadius).to(equal(10.0))
                expect(subject.candyButton.clipsToBounds).to(beTrue())
            }
        }
    }
}
