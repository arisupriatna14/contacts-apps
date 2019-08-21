//
//  AddContactTableViewController.swift
//  iOSDay4
//
//  Created by Ari Supriatna on 18/08/19.
//  Copyright © 2019 Ari Supriatna. All rights reserved.
//

import UIKit

protocol AddContactTableViewControllerDelegate {
    func didCreateContact(contact: Contact)
}

class AddContactTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var saveButtonOutlet: UIButton!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var dateOfBirthTextField: UITextField!
    @IBOutlet weak var addressTextView: UITextView!
    
    var delegate: AddContactTableViewControllerDelegate?
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        imagePicker.delegate = self
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
    
    
    @IBAction func cameraTapped(_ sender: UITapGestureRecognizer) {
        showAlert()
    }
    
    //MARK: AlertController
    func showAlert() {
        let alert = UIAlertController(title: "Choose Avatar", message: nil, preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { (action) in self.showCamera()}
        let galleryAction = UIAlertAction(title: "Gallery", style: .default) { (action) in self.showGallery()}
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(cameraAction)
        alert.addAction(galleryAction)
        alert.addAction(cancelAction)
        
        switch UIDevice.current.userInterfaceIdiom {
            case .pad:
                alert.popoverPresentationController?.sourceView = avatarImageView
                alert.popoverPresentationController?.sourceRect = avatarImageView.bounds
                alert.popoverPresentationController?.permittedArrowDirections = .up
            default:
                break
        }
        
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARK: Helpers
    func showCamera() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
            print("You have a camera, lets use it!")
        } else {
            let alert = UIAlertController(title: "Warning", message: "Camera not found", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
            print("You have no camera")
        }
    }
    
    func showGallery() {
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    //MARK: ImagePickerControllerDelegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let tempImage = info[.originalImage] {
            avatarImageView.contentMode = .scaleAspectFit
            avatarImageView.image = tempImage as? UIImage
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func createNewContact() {
        let newContact = Contact(name: nameTextField.text!, surname: surnameTextField.text!, phoneNumber: phoneNumberTextField.text!)
        
        delegate!.didCreateContact(contact: newContact)
        self.dismiss(animated: true, completion: nil)
    }
    
}
