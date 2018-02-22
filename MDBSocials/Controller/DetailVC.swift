//
//  DetailVC.swift
//  MDBSocials
//
//  Created by Ethan Wong on 2/20/18.
//  Copyright © 2018 Ethan Wong. All rights reserved.
//

import UIKit

var interestCount: Int = 0
class DetailVC: UIViewController {
    var eventPic: UIImageView!
    var eventPosters: UILabel!
    var eventTitle: UILabel!
    var interestButton: UIButton!
    var interestLabel: UILabel!
    var borderBox: UILabel!
    var textBox: UILabel!
    var desc: UITextView!
    var viewTitle: UILabel!
    let MDBColor = UIColor(red:0.16, green:0.73, blue:1.00, alpha:1.0)
    var isSelected = false
    var picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        setUpEventPic()
        setUpEventPoster()
        setUpEventTitle()
        setUpEventDescription()
        setUpInterestedButton()
        setUpInterestCount()
        
    }
    
    func setUpUI(){
        let vfw = view.frame.width
        let vfh = view.frame.height
        view.backgroundColor = MDBColor
        
        viewTitle = UILabel(frame: CGRect(x: vfw*0.04, y: vfh*0.12, width: vfw-30, height: vfh*0.1))
        viewTitle.text = "Time and Date"
        viewTitle.textColor = .white
        viewTitle.font = UIFont(name:"HelveticaNeue", size: 24)
        
        borderBox = UILabel(frame: CGRect(x: vfw*0.04, y: vfh*0.58, width: vfw-30, height: vfh*0.4))
        borderBox.backgroundColor = UIColor.white.withAlphaComponent(0.6)
        borderBox.layer.masksToBounds = true
        borderBox.layer.cornerRadius = 10
        view.addSubview(borderBox)
        view.addSubview(viewTitle)
    }
    
    func setUpEventPic(){
        let vfw = view.frame.width
        let vfh = view.frame.height
        eventPic = UIImageView(frame: CGRect(x: vfw*0.04, y: vfh*0.2, width: vfw-30, height: vfh*0.35))
        eventPic.image = UIImage(named:"default-image")
        eventPic.layer.borderWidth = 1
        eventPic.layer.masksToBounds = false
        eventPic.layer.borderColor = UIColor.black.cgColor
        eventPic.layer.cornerRadius = 10
        eventPic.clipsToBounds = true
        view.addSubview(eventPic)
    }
    
    func setUpEventPoster(){
        let vfw = view.frame.width
        let vfh = view.frame.height
        eventPosters = UILabel(frame: CGRect(x: vfw*0.08, y: vfh * 0.9, width: vfw-50, height: vfh*0.1))
        eventPosters.text = "Created By: Ethan Wong"
        eventPosters.textColor = .black
        view.addSubview(eventPosters)
    }
    
    func setUpEventTitle(){
        let vfw = view.frame.width
        let vfh = view.frame.height
        eventTitle = UILabel(frame: CGRect(x: vfw*0.08, y: vfh * 0.58, width: vfw-50, height: vfh*0.1))
        eventTitle.font = UIFont(name: "HelveticaNeue", size: 40)
        eventTitle.text = "Infosession"
        eventTitle.textColor = .white
        view.addSubview(eventTitle)
    }
    
    func setUpEventDescription(){
        let vfw = view.frame.width
        let vfh = view.frame.height
        textBox = UILabel(frame: CGRect(x: vfw*0.08, y: vfh*0.68, width: vfw-60, height: vfh*0.16))
        textBox.backgroundColor = UIColor.white
        textBox.layer.masksToBounds = true
        textBox.layer.cornerRadius = 10
        view.addSubview(textBox)
        
        desc = UITextView(frame: CGRect(x: vfw*0.12, y: vfh*0.7, width: vfw-90, height: vfw*0.18))
        desc.text = "This is a description. This is a description.This is a description.This is a description. This is a description. This is a description. This is a description. This is a description."
        view.addSubview(desc)
    }
    
    func setUpInterestCount() {
        let vfw = view.frame.width
        let vfh = view.frame.height
        let interestTextView = UITextView(frame: CGRect(x: vfw*0.68, y: vfh * 0.92, width: vfw*1.2, height: vfh*0.1))
        interestTextView.text = "Interested"
        interestTextView.font = UIFont(name:"HelveticaNeue", size: 15)
        interestTextView.backgroundColor = .clear
        interestTextView.textColor = .black
        view.addSubview(interestTextView)
        
        interestLabel = UILabel(frame: CGRect(x: vfw*0.76, y: vfh*0.82, width: vfw*0.1, height: vfh*0.16))
        interestLabel.text = String(interestCount)
        interestLabel.font = UIFont(name: "HelveticaNeue", size: 35)
        view.addSubview(interestLabel)
    }
    
    func setUpInterestedButton(){
        let vfw = view.frame.width
        let vfh = view.frame.height
        interestButton = UIButton(frame: CGRect(x: vfw*0.08, y: vfh*0.86, width: vfw*0.5, height: vfh*0.06))
        interestButton.setTitle("I'm Interested!", for: .normal)
        interestButton.setTitleColor(.white, for: .normal)
        interestButton.layer.cornerRadius = 10
        interestButton.clipsToBounds = true
        interestButton.layer.borderColor = UIColor.white.cgColor
        interestButton.layer.borderWidth = 1
        interestButton.addTarget(self, action: #selector(userInterested), for: .touchUpInside)
        view.addSubview(interestButton)
    }
    
    @objc func userInterested(_ sender: UIButton) {
        if sender.backgroundColor == .green {
            sender.backgroundColor = .clear
            interestCount -= 1
        } else {
            sender.backgroundColor = .green
            interestCount += 1
        }
    }
}
