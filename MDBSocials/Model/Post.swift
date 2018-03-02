//
//  Post.swift
//  MDBSocials
//
//  Created by Ethan Wong on 2/20/18.
//  Copyright © 2018 Ethan Wong. All rights reserved.
//

import Foundation
import UIKit
import Firebase


class Post {
    var text: String?
    var imageUrl: String?
    var posterId: String?
    var poster: String?
    var numInterested: [String] = []
    var id: String?
    var image: UIImage?
    var date: String?
    var time: String?
    var postTitle: String?
    
    
    init(id: String, postDict: [String:Any]?) {
        self.id = id
        if postDict != nil {
            if let postTitle = postDict!["postTitle"] as? String {
                self.postTitle = postTitle
            }
            if let numInterested = postDict!["numInterested"] as? [String] {
                self.numInterested = numInterested
            }
            if let text = postDict!["text"] as? String {
                self.text = text
            }
            if let imageUrl = postDict!["imageUrl"] as? String {
                self.imageUrl = imageUrl
            }
            if let date = postDict!["date"] as? String {
                self.date = date
            }
            if let time = postDict!["time"] as? String {
                self.time = time
            }
            if let posterId = postDict!["posterId"] as? String {
                self.posterId = posterId
            }
            if let poster = postDict!["poster"] as? String {
                self.poster = poster
            }
        }
    }
    
    func getImage(withBlock: @escaping () -> ()) {
        //TODO: Get User's profile picture
        let ref = Storage.storage().reference().child("/Posts/\(id!)")
        ref.getData(maxSize: 1 * 2048 * 2048) { data, error in
            if error != nil {
                print(error)
            } else {
                self.image = UIImage(data: data!)
            }
            withBlock()
        }
    }
}

