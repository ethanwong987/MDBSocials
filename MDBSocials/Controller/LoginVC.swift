//
//  ViewController.swift
//  MDBSocials
//
//  Created by Ethan Wong on 2/19/18.
//  Copyright © 2018 Ethan Wong. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class LoginVC: UIViewController {
    var userName: SkyFloatingLabelTextField!
    var passWord: SkyFloatingLabelTextField!
    var email: SkyFloatingLabelTextField!
    var welcomeTitle: UILabel!
    var borderBox: UILabel!
    var loginButton: UIButton!
    var signUpButton: UIButton!
    var MDBLogo: UIImageView!
    var MDBTitle: UILabel!
    let MDBColor = UIColor(red:0.16, green:0.73, blue:1.00, alpha:1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLoginUI()
        createButtons()
        createTitle()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }

    func setUpLoginUI() {
        let vfw = view.frame.width
        let vfh = view.frame.height
        
        view.backgroundColor = MDBColor
        borderBox = UILabel(frame: CGRect(x: vfw*0.04, y: vfh*0.58, width: vfw-30, height: 270))
        borderBox.backgroundColor = UIColor.white.withAlphaComponent(0.6)
        borderBox.layer.masksToBounds = true
        borderBox.layer.cornerRadius = 10
        
        userName = SkyFloatingLabelTextField(frame: CGRect(x: vfw * 0.07, y: vfh*0.6, width: vfw - 60, height: 45))
        userName.lineColor = .orange
        userName.selectedTitleColor = .orange
        userName.selectedLineColor = .orange
        userName.tintColor = .orange

        passWord = SkyFloatingLabelTextField(frame: CGRect(x: vfw * 0.07, y: vfh*0.7, width:
           vfw - 60, height: 45))
        passWord.lineColor = .orange
        passWord.selectedTitleColor = .orange
        passWord.selectedLineColor = .orange
        
        userName.placeholder = "Username"
        userName.placeholderColor = .orange
        passWord.placeholder = "Password"
        passWord.placeholderColor = .orange
        
        view.addSubview(borderBox)
        view.addSubview(userName)
        view.addSubview(passWord)
    }
    
    func createButtons() {
        let vfw = view.frame.width
        let vfh = view.frame.height
        let MDBColor = UIColor(red:0.16, green:0.73, blue:1.00, alpha:1.0)
        loginButton = UIButton(frame: CGRect(x: vfw * 0.07, y: vfh * 0.81, width: vfw - 50, height: 40))
        loginButton.setTitle("Login", for: .normal)
        loginButton.backgroundColor = .orange
        loginButton.addTarget(self, action: #selector(toFeed), for: .touchUpInside)
        loginButton.layer.cornerRadius = 10
        
        signUpButton = UIButton(frame: CGRect(x: vfw * 0.07, y: vfh * 0.9, width: vfw - 50, height: 40))
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.backgroundColor = MDBColor
        signUpButton.addTarget(self, action: #selector(toSignUp), for: .touchUpInside)
        signUpButton.layer.cornerRadius = 10
        
        view.addSubview(loginButton)
        view.addSubview(signUpButton)
    }
    
    func createTitle() {
        let vfw = view.frame.width
        let vfh = view.frame.height
        
        MDBLogo = UIImageView(frame: CGRect(x:vfw * 0.06, y: -(vfh * 0.3), width: UIScreen.main.bounds.width - 50, height: UIScreen.main.bounds.height))
        MDBLogo.image = UIImage(named: "mdb_white")
        MDBLogo.contentMode = .scaleAspectFit
    
        MDBTitle = UILabel(frame: CGRect(x: vfw*0.19, y: vfh*0.1, width: vfw-30, height: 300))
        MDBTitle.text = "SOCIALS"
        MDBTitle.textAlignment = .center
        MDBTitle.textColor = .white
        MDBTitle.font = UIFont(name: "Helvetica Neue", size: 60)
        
        welcomeTitle = UILabel(frame: CGRect(x: vfw*0.07, y: vfh*0.5, width: vfw-30, height: 45))
        welcomeTitle.text = "WELCOME! PLEASE SIGN IN."
        welcomeTitle.font = UIFont(name: "Helvetica Neue", size: 24)
        welcomeTitle.textColor = .white
        
        view.addSubview(welcomeTitle)
        view.addSubview(MDBTitle)
        view.addSubview(MDBLogo)
    }
    
    @objc func toFeed() {
        performSegue(withIdentifier: "toFeed", sender: self)
    }
    
    @objc func toSignUp() {
        performSegue(withIdentifier: "toSignUp", sender: self)
    }
}

