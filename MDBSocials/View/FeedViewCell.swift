//
//  FeedViewCell.swift
//  MDBSocials
//
//  Created by Ethan Wong on 2/20/18.
//  Copyright © 2018 Ethan Wong. All rights reserved.
//

//
//  PostCollectionViewCell.swift
//  MDBSocials
//
//  Created by Ethan Wong on 9/22/17.
//  Copyright © 2018 Ethan Wong. All rights reserved.
//

import UIKit

class FeedViewCell: UICollectionViewCell {
    
    var profileImage: UIImageView!
    var posterText: UILabel!
    var postText: UILabel!
    var numInterested: UILabel!
    let MDBColor = UIColor(red:0.16, green:0.73, blue:1.00, alpha:1.0)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        for subview in self.subviews {
            subview.removeFromSuperview()
        }
        self.backgroundColor = .white
        setupEventText()
        setUpNumInterested()
        setupEventPoster()
        setupEventImage()

    }
    
    func setupEventImage() {
        profileImage = UIImageView(frame: CGRect(x: self.frame.width - 95, y: 0, width: 90, height: 100))
        profileImage.clipsToBounds = true
        profileImage.layer.cornerRadius = 10
        profileImage.contentMode = .scaleAspectFit
        profileImage.image = UIImage(named: "MDB")
        addSubview(profileImage)
    }
    
    func setUpNumInterested() {
        let sfw = self.frame.width
        let sfh = self.frame.height
        
        numInterested = UILabel(frame: CGRect(x: 10, y: 72, width: sfw, height: 20))
        numInterested.text = "Interested: 7"
        numInterested.font = UIFont(name: "Helvetica Neue", size: 17)
        numInterested.textColor = .green
        
        addSubview(numInterested)
        
    }
    
    func setupEventText() {
        let sfw = self.frame.width
        let sfh = self.frame.height
        posterText = UILabel(frame: CGRect(x: 10, y: 10, width: sfw, height: 30))
        posterText.textColor = MDBColor
        posterText.font = UIFont.systemFont(ofSize: 24, weight: UIFont.Weight(rawValue: 2))
        posterText.adjustsFontForContentSizeCategory = true
        addSubview(posterText)
    }
    
    func setupEventPoster() {
        let sfw = self.frame.width
        let sfh = self.frame.height
        postText = UILabel(frame: CGRect(x: 10, y: 35, width: self.frame.width - 20, height: 30))
        postText.textColor = UIColor.black
        postText.font = UIFont(name: "Helvetica Neue", size: 17)
        postText.adjustsFontForContentSizeCategory = true
        addSubview(postText)
    }
    
}

