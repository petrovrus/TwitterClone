//
//  Tweet.swift
//  TwitterClone
//
//  Created by Ruslan on 13/09/2017.
//  Copyright © 2017 Ruslan Petrov. All rights reserved.
//

import UIKit
import SwiftyJSON

struct Tweet {
    let user: User
    let message: String
    
    init(json: JSON) {
        let userJSON = json["user"]
        self.user = User(json: userJSON)
        
        self.message = json["message"].stringValue
    }
}
