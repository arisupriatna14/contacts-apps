//
//  ProfileViewController.swift
//  iOSDay4
//
//  Created by Ari Supriatna on 18/08/19.
//  Copyright © 2019 Ari Supriatna. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var dateOfBirth: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    var localContact: Contact!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    //MARK: UpdateUI
    func updateUI() {
        self.title = localContact.name
        fullNameLabel.text = localContact.fullName
        phoneNumberLabel.text = localContact.phoneNumber
        dateOfBirth.text = dateFormatter().string(from: localContact.dateOfBirth)
        
        if localContact.avatar != nil {
            self.avatarImageView.image = localContact.avatar
        }
        
        if localContact.address != nil {
            self.addressLabel.text = localContact.address
        }
    }
}
