//
//  ContactsViewController.swift
//  iOSDay4
//
//  Created by Ari Supriatna on 18/08/19.
//  Copyright © 2019 Ari Supriatna. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddContactTableViewControllerDelegate {
    
    var allContacts: [Contact] = []
    
    //MARK: Global Variable
    var nameTextField: UITextField!
    var surnameTextField: UITextField!
    var phoneNumberTextField: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: TabeViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allContacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ContactTableViewCell
        
        let myContact = allContacts[indexPath.row]

        cell.setupCell(contact: myContact)
//        cell.textLabel?.text = myContact.fullName
//        cell.detailTextLabel?.text = myContact.phoneNumber
        
        return cell
    }
    
    //MARK: TableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "contactsToProfileSeg", sender: indexPath)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        allContacts.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
    //MARK: IBAction
    @IBAction func addBarButtonPressed(_ sender: Any) {
        showAlertController()
    }
    
    //MARK: Helpers
    func showAlertController() {
        let alertController = UIAlertController(title: "Create New Contact", message: nil, preferredStyle: .alert)
        
        let saveButton = UIAlertAction(title: "SAVE", style: .default) { (action) in
            
            let name = self.nameTextField.text!
            let surname = self.surnameTextField.text!
            let phoneNumber = self.phoneNumberTextField.text!
            
            if name != "" && surname != "" && phoneNumber != "" {
                self.createNewContact()
                self.showAlertSuccess(message: "Contact Saved")
            } else {
                self.showAlertWarning(message: "Please input all field!")
            }
        }
        
        let cancelButton = UIAlertAction(title: "CANCEL", style: .cancel) { (action) in }
        
        alertController.addTextField { (nameTextField) in
            nameTextField.placeholder = "Name"
            nameTextField.returnKeyType = .next
            
            self.nameTextField = nameTextField
        }
        
        alertController.addTextField { (surnameTextField) in
            surnameTextField.placeholder = "Surname"
            surnameTextField.returnKeyType = .next
            
            self.surnameTextField = surnameTextField
        }
        
        alertController.addTextField { (phoneNumberTextField) in
            phoneNumberTextField.placeholder = "Phone"
            phoneNumberTextField.keyboardType = .phonePad
            phoneNumberTextField.returnKeyType = .done
            
            self.phoneNumberTextField = phoneNumberTextField
        }
        
        alertController.addAction(saveButton)
        alertController.addAction(cancelButton)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func createNewContact() {
        let name = self.nameTextField.text!
        let surname = self.surnameTextField.text!
        let phoneNumber = self.phoneNumberTextField.text!
        
        let newContact = Contact(name: name, surname: surname, phoneNumber: phoneNumber)
        
        self.allContacts.append(newContact)
        self.tableView.reloadData()
    }
    
    func showAlertWarning(message: String) {
        let alertWarningController = UIAlertController(title: "Warning", message: message, preferredStyle: .alert)
        let buttonOk = UIAlertAction(title: "OK", style: .default) { (action) in self.showAlertController()}
        
        alertWarningController.addAction(buttonOk)
        self.present(alertWarningController, animated: true, completion: nil)
    }
    
    func showAlertSuccess(message: String) {
        let alertSuccessController = UIAlertController(title: "Success", message: message, preferredStyle: .alert)
        let buttonOk = UIAlertAction(title: "OK", style: .default) { (action) in }
        
        alertSuccessController.addAction(buttonOk)
        self.present(alertSuccessController, animated: true, completion: nil)
    }
    
    //MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "contactsToProfileSeg" {
            let profileVC = segue.destination as! ProfileViewController
            let indexPath = sender as! IndexPath
            let tempContact = allContacts[indexPath.row]
            
            profileVC.localContact = tempContact
        }
        
        if segue.identifier == "contactsToAddContactSeg" {
            let addContactVC = segue.destination as! AddContactTableViewController
            addContactVC.delegate = self
        }
    }
    
    //MARK: AddContactTableViewControllerDelegate
    func didCreateContact(contact: Contact) {
        allContacts.append(contact)
        tableView.reloadData()
        print("New contact was created \(contact.fullName)!")
    }
    
    
}
