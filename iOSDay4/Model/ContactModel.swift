//
//  ContactModel.swift
//  iOSDay4
//
//  Created by Ari Supriatna on 18/08/19.
//  Copyright © 2019 Ari Supriatna. All rights reserved.
//

import Foundation
import UIKit

class Contact {
    var name: String
    var surname: String
    var fullName: String
    var phoneNumber: String
    var dateOfBirth: Date
    var avatar: UIImage?
    var address: String?
    
    init(name: String, surname: String, phoneNumber: String) {
        self.name = name
        self.surname = surname
        self.fullName = "\(name) \(surname)"
        self.phoneNumber = phoneNumber
        self.dateOfBirth = Date()
    }
}
