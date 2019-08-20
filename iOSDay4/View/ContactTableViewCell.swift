//
//  ContactTableViewCell.swift
//  iOSDay4
//
//  Created by Ari Supriatna on 19/08/19.
//  Copyright © 2019 Ari Supriatna. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: Setup UI Cell
    func setupCell(contact: Contact) {
        fullNameLabel.text = contact.fullName
        phoneNumberLabel.text = contact.phoneNumber
        
//        if avatarImageView != nil {
//            avatarImageView.image = contact.avatar
//        } else {
//            avatarImageView.image = UIImage(named: "user")!
//        }
    }

}
