//
//  ViewController.swift
//  ValuteConverter
//
//  Created by Максим Солнцев on 8/13/20.
//  Copyright © 2020 Максим Солнцев. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var firstCurencyTextField: UITextField!
    @IBOutlet weak var secondCurrencyTextField: UITextField!
    @IBOutlet weak var nominalLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var chooseValuteButton: UIButton!
    
    var valuteValue: ValuteResponse?
    var networking = Networking()
    var dataName: String = "Valute name"
    var dataValue: Double = 0.0
    var dataNominal: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        firstCurencyTextField.delegate = self
        firstCurencyTextField.keyboardType = .decimalPad
        firstCurencyTextField.clearsOnBeginEditing = true
        
        secondCurrencyTextField.delegate = self
        secondCurrencyTextField.keyboardType = .decimalPad
        secondCurrencyTextField.clearsOnBeginEditing = true
        
        self.firstCurencyTextField.text = "\(self.dataNominal)"
        self.secondCurrencyTextField.text = "\(self.dataValue)"
        self.nameLabel.text = self.dataName
        
    }
    
    @IBAction func firstCurrencyTextField(_ sender: UITextField) {
        
        if firstCurencyTextField.text != ""{
            
            let value: Double = Double(firstCurencyTextField.text!)!
            secondCurrencyTextField.text = "\(value * self.dataValue / Double(self.dataNominal))"
        }
    }
    
    @IBAction func secondCurrencyTextField(_ sender: UITextField) {
        
        if secondCurrencyTextField.text != "" {
            
            let value: Double = Double(secondCurrencyTextField.text!)!
            firstCurencyTextField.text = "\(value / self.dataValue * Double(self.dataNominal))"
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        let newLength = text.count + string.count - range.length
        return newLength <= 7
    }
}






