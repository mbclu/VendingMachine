//
//  ViewController.swift
//  VendingMachine
//
//  Created by Mitch Clutter on 2/12/17.
//  Copyright © 2017 Mitch Clutter. All rights reserved.
//

import UIKit

class VendingMachineViewController: UIViewController {

    @IBOutlet weak var lcd: UITextField!
    
    var vendingMachine:VendingMachine!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        vendingMachine = VendingMachine_Impl()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lcd.text = vendingMachine.display()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func twentyFiveCentCoinInserted(_ sender: UIButton) {
        updateDisplayForCoin(Coin.quarter)
    }
    
    @IBAction func tenCentCoinInserted(_ sender: UIButton) {
        updateDisplayForCoin(Coin.dime)
    }
    
    @IBAction func fiveCentCoinInserted(_ sender: UIButton) {
        updateDisplayForCoin(Coin.nickel)
    }
    
    func updateDisplayForCoin(_ coin: Coin) {
        self.vendingMachine.insert(coin)
        lcd.text = vendingMachine.display()
        
    }
}

