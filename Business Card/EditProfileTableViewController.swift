//
//  EditProfileTableViewController.swift
//  Business Card
//
//  Created by Magnise-2 on 7/8/19.
//  Copyright © 2019 Andrian Nebeso. All rights reserved.
//

import UIKit

class EditProfileTableViewController: UITableViewController {

    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var bornOnTextField: UITextField!
    @IBOutlet weak var FromTextField: UITextField!
    @IBOutlet weak var studiedAtTextField: UITextField!
    @IBOutlet weak var biographyTextField: UITextView!
    @IBOutlet weak var livesInTextField: UITextField!
    var editableUserProfile = User()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        self.phoneNumberTextField.keyboardType = UIKeyboardType.phonePad
        displayInfoOnEdit(userInfo: User(userDefaults: UserDefaults.standard))
    }
 
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
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
    @IBAction func saveButtonPressed(_ sender: Any) {
        let editableUserProfile = User()
        updateUserFromView(userInfo: editableUserProfile)
        editableUserProfile.saveToUserDefaults(userDefaults: UserDefaults.standard)
    }
    
    @objc func datePickerFromValueChanged(sender:UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d, y"
        dateTextField.text = dateFormatter.string(from: sender.date)
    }
    
}

extension EditProfileTableViewController {
    func updateUserFromView(userInfo: User){
        userInfo.currentLocation = livesInTextField.text ?? ""
        userInfo.birthdayDate = bornOnTextField.text ?? ""
        userInfo.originalLocation = FromTextField.text ?? ""
        userInfo.studiedAt = studiedAtTextField.text ?? ""
        if phoneNumberTextField.text!.prefix(4) != "+380" {
            userInfo.phoneNumber = "+380" + (phoneNumberTextField.text ?? "").replacingOccurrences(of: "+", with: "")
        }
        else {
            userInfo.phoneNumber = phoneNumberTextField.text ?? "+380"
        }
        userInfo.userBiography = biographyTextField.text ?? ""
    }
}

extension EditProfileTableViewController {
    func displayInfoOnEdit(userInfo: User){
        livesInTextField.text = userInfo.currentLocation
        bornOnTextField.text = userInfo.birthdayDate
        FromTextField.text = userInfo.originalLocation
        studiedAtTextField.text = userInfo.studiedAt
        phoneNumberTextField.text = userInfo.phoneNumber
        biographyTextField.text = userInfo.userBiography
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
