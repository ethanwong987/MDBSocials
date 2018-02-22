//
//  User.swift
//  MDBSocials
//
//  Created by Ethan Wong on 2/20/18.
//  Copyright © 2018 Ethan Wong. All rights reserved.
//

import Foundation
import UIKit

class Users {
    var name: String?
    var email: String?
    var password: String?
    var id: String?
    var username: String?
    
    init(id: String, userDict: [String:Any]?) {
        self.id = id
        if userDict != nil {
            if let name = userDict!["name"] as? String {
                self.name = name
            }
            if let username = userDict!["username"] as? String {
                self.name = username
            }
            if let password = userDict!["password"] as? String {
                self.password = password
            }
            if let email = userDict!["email"] as? String {
                self.email = email
            }
        }
    }
    
    static func getCurrentUser(withId: String, block: @escaping (Users) -> ()) {
        FBFunctions.fetchUser(id: withId, withBlock: {(user) in
            block(user)
        })
    }
    
    
}

