//
//  SignUpVC.swift
//  MDBSocials
//
//  Created by Ethan Wong on 2/20/18.
//  Copyright © 2018 Ethan Wong. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class SignUpVC: UIViewController {
    var fullname: SkyFloatingLabelTextField!
    var userName: SkyFloatingLabelTextField!
    var passWord: SkyFloatingLabelTextField!
    var confirmPwd: SkyFloatingLabelTextField!
    var email: SkyFloatingLabelTextField!
    var signUpTitle: UILabel!
    var borderBox: UILabel!
    var signUpButton: UIButton!
    var backToLogin: UIButton!
    var profileImage: UIButton!
    let MDBColor = UIColor(red:0.16, green:0.73, blue:1.00, alpha:1.0)
    
    var picker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        createNameLabels()
        createPassWordLabel()
        createUserLabel()
        createEmailLabel()
        createButtons()
    }
    
    func createNameLabels() {
        let vfw = view.frame.width
        let vfh = view.frame.height
        fullname = SkyFloatingLabelTextField(frame: CGRect(x: vfw * 0.07, y: vfh*0.4, width: vfw - 60, height: 45))
        fullname.lineColor = .orange
        fullname.selectedTitleColor = .orange
        fullname.selectedLineColor = .orange
        fullname.tintColor = .orange
        fullname.placeholder = "Full Name"
        fullname.placeholderColor = .orange
        view.addSubview(fullname)
    }
    
    func createUserLabel() {
        let vfw = view.frame.width
        let vfh = view.frame.height
        userName = SkyFloatingLabelTextField(frame: CGRect(x: vfw * 0.07, y: vfh*0.5, width: vfw - 60, height: 45))
        userName.lineColor = .orange
        userName.selectedTitleColor = .orange
        userName.selectedLineColor = .orange
        userName.tintColor = .orange
        userName.placeholder = "Username"
        userName.placeholderColor = .orange
        view.addSubview(userName)
    }
    
    func createPassWordLabel() {
        let vfw = view.frame.width
        let vfh = view.frame.height
        passWord = SkyFloatingLabelTextField(frame: CGRect(x: vfw * 0.07, y: vfh*0.7, width:
            vfw - 60, height: 45))
        passWord.lineColor = .orange
        passWord.selectedTitleColor = .orange
        passWord.selectedLineColor = .orange
        passWord.placeholder = "Password"
        passWord.placeholderColor = .orange
        view.addSubview(passWord)
    }
    
    func createEmailLabel() {
        let vfw = view.frame.width
        let vfh = view.frame.height
        email = SkyFloatingLabelTextField(frame: CGRect(x: vfw * 0.07, y: vfh*0.6, width: vfw - 60, height: 45))
        email.lineColor = .orange
        email.selectedTitleColor = .orange
        email.selectedLineColor = .orange
        email.tintColor = .orange
        email.placeholder = "Email"
        email.placeholderColor = .orange
        view.addSubview(email)
    }
    
    func setUpUI() {
        let vfw = view.frame.width
        let vfh = view.frame.height
        
        view.backgroundColor = MDBColor
        borderBox = UILabel(frame: CGRect(x: vfw*0.04, y: vfh*0.38, width: vfw-30, height: vfh * 0.55))
        borderBox.backgroundColor = UIColor.white.withAlphaComponent(0.6)
        borderBox.layer.masksToBounds = true
        borderBox.layer.cornerRadius = 10
        
        signUpTitle = UILabel(frame: CGRect(x: vfw*0.04, y: vfh*0.12, width: vfw-30, height: 100))
        signUpTitle.text = "SIGN UP"
        signUpTitle.textColor = .white
        signUpTitle.font = UIFont(name: "Helvetica Neue", size: 50)
        signUpTitle.textAlignment = .center
        signUpTitle.layer.borderColor = UIColor.white.cgColor
        signUpTitle.layer.borderWidth = 3
        
        view.addSubview(signUpTitle)
        view.addSubview(borderBox)
    }
    
    func createButtons() {
        let vfw = view.frame.width
        let vfh = view.frame.height
        
        signUpButton = UIButton(frame: CGRect(x: vfw * 0.07, y: vfh * 0.81, width: vfw - 50, height: 40))
        signUpButton.setTitle("Create Account", for: .normal)
        signUpButton.backgroundColor = .orange
        signUpButton.addTarget(self, action: #selector(toFeed), for: .touchUpInside)
        signUpButton.layer.cornerRadius = 10
        
        backToLogin = UIButton(frame: CGRect(x: vfw * 0.07, y: vfh * 0.87, width: vfw - 50, height: 40))
        backToLogin.setTitle("Back To Login", for: .normal)
        backToLogin.setTitleColor(MDBColor, for: .normal)
        backToLogin.addTarget(self, action: #selector(toLogin), for: .touchUpInside)
        
        view.addSubview(backToLogin)
        view.addSubview(signUpButton)
    }
    
    @objc func toFeed() {
        performSegue(withIdentifier: "toFeed", sender: self)
    }
    
    @objc func toLogin() {
        self.dismiss(animated: true, completion: nil)
    }
}