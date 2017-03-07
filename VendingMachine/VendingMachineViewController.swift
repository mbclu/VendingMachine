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
    @IBOutlet weak var vendingAreaView: UIView!
    @IBOutlet weak var coinReturnView: UIView!
    
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
        applyCornerRadius(vendingAreaView)
        applyCornerRadius(coinReturnView)
        
        lcd.text = vendingMachine.display()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func coinInserted(_ sender: UIButton) {
        self.vendingMachine.insert(Coin(rawValue: sender.tag)!)
        lcd.text = vendingMachine.display()
    }
    
    @IBAction func productSelected(_ sender: UIButton) {
        vendingMachine.dispense(Product(rawValue: sender.tag)!)
        lcd.text = vendingMachine.display()
    }
    
    fileprivate func applyCornerRadius(_ view: UIView) {
        view.clipsToBounds = true
        view.layer.cornerRadius = 10.0
    }
}

