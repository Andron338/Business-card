//
//  EditViewController.swift
//  Business Card
//
//  Created by Magnise-2 on 7/8/19.
//  Copyright © 2019 Andrian Nebeso. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {

    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
        self.phoneNumberTextField.keyboardType = UIKeyboardType.decimalPad
    }
    @IBAction func dateTextField(_ sender: UITextField) {
        let datePickerView:UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePicker.Mode.date
        if dateTextField.text! != "" {
            let dateSetFormatter = DateFormatter()
            dateSetFormatter.dateFormat = "MMMM d, y"
            datePickerView.date = dateSetFormatter.date(from: dateTextField.text!)!
        }
        dateTextField.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(datePickerFromValueChanged), for: UIControl.Event.valueChanged)
        }
    @objc func datePickerFromValueChanged(sender:UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d, y"
        dateTextField.text = dateFormatter.string(from: sender.date)
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
    

    


