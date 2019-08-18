//
//  AddContactTableViewController.swift
//  iOSDay4
//
//  Created by Ari Supriatna on 18/08/19.
//  Copyright © 2019 Ari Supriatna. All rights reserved.
//

import UIKit

class AddContactTableViewController: UITableViewController {
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var saveButtonOutlet: UIButton!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var dateOfBirthTextField: UITextField!
    @IBOutlet weak var addressTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    //MARK: TabelViewDelegates
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ""
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1 {
            return 20
        }
        return 0
    }
    
    //MARK: IBAction
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        if nameTextField.text != "" && surnameTextField.text != "" && phoneNumberTextField.text != "" {
            createNewContact()
        } else {
            print("Please input field name, surname, phoneNumber")
        }
    }
    
    func createNewContact() {
        let newContact = Contact(name: nameTextField.text!, surname: surnameTextField.text!, phoneNumber: phoneNumberTextField.text!)
        
        print("New Contact \(newContact)")
        print(newContact.name)
        print(newContact.surname)
        print(newContact.fullName)
    }
    
}
