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
    
    var localContact: Contact!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    //MARK: UpdateUI
    func updateUI() {
        fullNameLabel.text = localContact.fullName
        phoneNumberLabel.text = localContact.phoneNumber
    }
}
