//
//  Helpers.swift
//  iOSDay4
//
//  Created by Ari Supriatna on 24/08/19.
//  Copyright © 2019 Ari Supriatna. All rights reserved.
//

import Foundation

let dateFormat = "dd/MM/yyyy"

func dateFormatter() -> DateFormatter {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = dateFormat
    
    return dateFormatter
}
