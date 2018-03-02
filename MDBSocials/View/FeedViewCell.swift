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
    
    var eventImg: UIImageView!
    var image: UIImage!
    var posterText: UILabel!
    var posterTextName: String!
    var descText: UILabel!
    var descTextName: String!
    var dateText: UILabel!
    var dateTextName: String!
    var timeText: UILabel!
    var timeTextName: String!
    var postText: UILabel!
    var postTextName: String!
    var numInterested: UILabel!
    var numInterestedName: String!
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
        createDateText()
        createTimeText()
    }
    
    func setupEventImage() {
        eventImg = UIImageView(frame: CGRect(x: self.frame.width - 95, y: 0, width: 90, height: 100))
        eventImg.image = image
        eventImg.clipsToBounds = true
        eventImg.layer.cornerRadius = 10
        eventImg.contentMode = .scaleAspectFill
        addSubview(eventImg)
    }
    
    func setUpNumInterested() {
        let sfw = self.frame.width
        let sfh = self.frame.height
        
        numInterested = UILabel(frame: CGRect(x: 10, y: 60, width: sfw, height: 20))
        numInterested.font = UIFont(name: "Helvetica Neue", size: 17)
        numInterested.textColor = .green
        numInterested.text = numInterestedName
        
        addSubview(numInterested)
    }
    
    func createDateText(){
        let sfw = self.frame.width
        let sfh = self.frame.height
        
        dateText = UILabel(frame: CGRect(x: 10, y: 80, width: sfw, height: 30))
        dateText.font = UIFont(name: "Helvetica Neue", size: 17)
        dateText.textColor = .black
        dateText.text = dateTextName
        
        addSubview(dateText)
        
    }
    func createTimeText() {
        let sfw = self.frame.width
        let sfh = self.frame.height
        
        timeText = UILabel(frame: CGRect(x: 10, y: 100, width: sfw, height: 30))
        timeText.font = UIFont(name: "Helvetica Neue", size: 17)
        timeText.textColor = .black
        timeText.text = timeTextName
        
        addSubview(timeText)
    }
    
    func setupEventText() {
        let sfw = self.frame.width
        let sfh = self.frame.height
        posterText = UILabel(frame: CGRect(x: 10, y: 10, width: sfw, height: 30))
        posterText.textColor = MDBColor
        posterText.font = UIFont.systemFont(ofSize: 24, weight: UIFont.Weight(rawValue: 2))
        posterText.adjustsFontForContentSizeCategory = true
        posterText.text = posterTextName
        addSubview(posterText)
    }
    
    func setupEventPoster() {
        let sfw = self.frame.width
        let sfh = self.frame.height
        postText = UILabel(frame: CGRect(x: 10, y: 35, width: self.frame.width - 20, height: 30))
        postText.textColor = UIColor.black
        postText.font = UIFont(name: "Helvetica Neue", size: 17)
        postText.adjustsFontForContentSizeCategory = true
        postText.text = postTextName
        addSubview(postText)
    }
    
}

