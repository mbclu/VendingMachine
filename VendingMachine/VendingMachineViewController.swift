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
    @IBOutlet weak var colaButton: UIButton!
    @IBOutlet weak var chipsButton: UIButton!
    @IBOutlet weak var candyButton: UIButton!
    
    var vendingMachine:VendingMachine!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        vendingMachine = VendingMachine_Impl()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        applyCornerRadius(colaButton)
        applyCornerRadius(chipsButton)
        applyCornerRadius(candyButton)
        
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
    
    fileprivate func updateDisplayForCoin(_ coin: Coin) {
        self.vendingMachine.insert(coin)
        lcd.text = vendingMachine.display()
    }
    
    fileprivate func applyCornerRadius(_ button: UIButton) {
        button.clipsToBounds = true
        button.layer.cornerRadius = 10.0
    }
}

