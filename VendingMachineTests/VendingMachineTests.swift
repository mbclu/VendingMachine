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
    
    enum Coins {
        case quarter
    }
    
    func testItDisplays_INSERT_COIN_WhenEmpty() {
        let underTest = VendingMachine()
        expect(underTest.display()).to(equal("INSERT COIN"))
    }
    
}
