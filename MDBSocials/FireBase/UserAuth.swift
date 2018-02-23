//
//  UserAuth.swift
//  MDBSocials
//
//  Created by Ethan Wong on 2/20/18.
//  Copyright © 2018 Ethan Wong. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth

class UserAuth {
    
    static func logIn(email: String, password: String, withBlock: @escaping (User?)->()) {
        Auth.auth().signIn(withEmail: email, password: password, completion: { (user: User?, error) in
            if error == nil {
                withBlock(user)
            }
        })
    }

    static func logOut(withBlock: @escaping ()->()) {
        print("logging out")
        //TODO: Log out using Firebase!
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            withBlock()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
}
