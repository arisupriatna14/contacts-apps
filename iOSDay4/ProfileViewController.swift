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
    
    var fullName: String!
    var phoneNumber: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fullNameLabel.text = fullName
        phoneNumberLabel.text = phoneNumber
    }
}
