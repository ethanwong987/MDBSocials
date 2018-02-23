//
//  SignUpVC.swift
//  MDBSocials
//
//  Created by Ethan Wong on 2/20/18.
//  Copyright © 2018 Ethan Wong. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import Firebase

class NewSocialVC: UIViewController {
    var eventName: SkyFloatingLabelTextField!
    var posterName: SkyFloatingLabelTextField!
    var enterDesc: SkyFloatingLabelTextField!
    var datePickerText: SkyFloatingLabelTextField!
    var timePickerText: SkyFloatingLabelTextField!
    var signUpTitle: UIImageView!
    var borderBox: UILabel!
    var eventPic: UIImageView!
    var signUpButton: UIButton!
    var backToLogin: UIButton!
    var profileImage: UIButton!
    var selectFromLibraryButton: UIButton!
    let MDBColor = UIColor(red:0.16, green:0.73, blue:1.00, alpha:1.0)
    
    var takePictureButton: UIButton!
    var timePicker: UIDatePicker!
    var picker = UIImagePickerController()
    var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        createNameLabel()
        createDescLabel()
        createDatePicker()
        createTimePicker()
        createEventLabel()
        createButtons()
    }
    
    func createEventLabel() {
        let vfw = view.frame.width
        let vfh = view.frame.height
        eventName = SkyFloatingLabelTextField(frame: CGRect(x: vfw * 0.07, y: vfh*0.3, width: vfw - 60, height: 45))
        eventName.lineColor = .orange
        eventName.selectedTitleColor = .orange
        eventName.selectedLineColor = .orange
        eventName.tintColor = .orange
        eventName.placeholder = "Event Name"
        eventName.placeholderColor = .orange
        view.addSubview(eventName)
    }
    
    func createNameLabel() {
        let vfw = view.frame.width
        let vfh = view.frame.height
        posterName = SkyFloatingLabelTextField(frame: CGRect(x: vfw * 0.07, y: vfh*0.4, width: vfw - 60, height: 45))
        posterName.lineColor = .orange
        posterName.selectedTitleColor = .orange
        posterName.selectedLineColor = .orange
        posterName.tintColor = .orange
        posterName.placeholder = "Post Creator"
        posterName.placeholderColor = .orange
        view.addSubview(posterName)
    }
    
    func createDescLabel() {
        let vfw = view.frame.width
        let vfh = view.frame.height
        enterDesc = SkyFloatingLabelTextField(frame: CGRect(x: vfw * 0.07, y: vfh*0.5, width: vfw - 60, height: 45))
        enterDesc.lineColor = .orange
        enterDesc.selectedTitleColor = .orange
        enterDesc.selectedLineColor = .orange
        enterDesc.tintColor = .orange
        enterDesc.placeholder = "Description of Event"
        enterDesc.placeholderColor = .orange
        view.addSubview(enterDesc)
    }
    
    func createDatePicker() {
        let vfw = view.frame.width
        let vfh = view.frame.height
        datePickerText = SkyFloatingLabelTextField(frame: CGRect(x: vfw * 0.07, y: vfh*0.6, width: vfw - 60, height: 45))
        datePickerText.lineColor = .orange
        datePickerText.selectedTitleColor = .orange
        datePickerText.selectedLineColor = .orange
        datePickerText.tintColor = .orange
        datePickerText.placeholder = "Date"
        datePickerText.placeholderColor = .orange
        datePickerText.adjustsFontSizeToFitWidth = true
        datePickerText.textAlignment = .left
        datePickerText.layer.masksToBounds = true
        datePickerText.textColor = .black
        view.addSubview(datePickerText)
        setupDatePicker()
    }
    
    func createTimePicker(){
        let vfw = view.frame.width
        let vfh = view.frame.height
        timePickerText = SkyFloatingLabelTextField(frame: CGRect(x: vfw * 0.07, y: vfh*0.7, width: vfw - 60, height: 45))
        timePickerText.lineColor = .orange
        timePickerText.selectedTitleColor = .orange
        timePickerText.selectedLineColor = .orange
        timePickerText.tintColor = .orange
        timePickerText.placeholder = "Time"
        timePickerText.placeholderColor = .orange
        timePickerText.adjustsFontSizeToFitWidth = true
        timePickerText.textAlignment = .left
        timePickerText.layer.masksToBounds = true
        timePickerText.textColor = .black
        view.addSubview(timePickerText)
        setUpTimePicker()
    }
    
    func setUpTimePicker(){
        timePicker = UIDatePicker()
        timePicker.datePickerMode = .time
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: #selector(getTime))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: self, action: #selector(cancel))
        toolbar.setItems([cancelButton,spaceButton,doneButton], animated: false)
        timePickerText.inputAccessoryView = toolbar
        timePickerText.inputView = timePicker
    }
    
    @objc func getTime() {
        timePicker.datePickerMode = .time
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        timePickerText.text = formatter.string(from: timePicker.date)
        self.view.endEditing(true)
    }
    
    func setupDatePicker(){
        datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: #selector(saveText))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: self, action: #selector(cancel))
        toolbar.setItems([cancelButton,spaceButton,doneButton], animated: false)
        datePickerText.inputAccessoryView = toolbar
        datePickerText.inputView = datePicker
    }
    
    @objc func saveText(){
        datePicker.datePickerMode = .date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
        let selectedDate = dateFormatter.string(from: datePicker.date)
        datePickerText.text = selectedDate
        self.view.endEditing(true)
    }
    
    @objc func cancel(){
        self.view.endEditing(true)
    }
    
    func setUpUI() {
        let vfw = view.frame.width
        let vfh = view.frame.height
        
        view.backgroundColor = MDBColor
        borderBox = UILabel(frame: CGRect(x: vfw*0.04, y: vfh*0.3, width: vfw-30, height: vfh * 0.65))
        borderBox.backgroundColor = UIColor.white.withAlphaComponent(0.6)
        borderBox.layer.masksToBounds = true
        borderBox.layer.cornerRadius = 10
        
        eventPic = UIImageView(frame: CGRect(x: vfw*0.04, y: vfh*0.05, width: vfw-30, height: vfh*0.2))
        selectFromLibraryButton = UIButton(frame: eventPic.frame)
        selectFromLibraryButton.setTitle("SELECT \n AN IMAGE", for: .normal)
        selectFromLibraryButton.titleLabel?.numberOfLines = 0
        selectFromLibraryButton.setTitleColor(UIColor.blue, for: .normal)
        selectFromLibraryButton.layer.borderColor = UIColor.white.cgColor
        selectFromLibraryButton.layer.borderWidth = 3
        selectFromLibraryButton.setTitleColor(.white, for: .normal)
        selectFromLibraryButton.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 50)
        selectFromLibraryButton.titleLabel?.textAlignment = .center
        selectFromLibraryButton.addTarget(self, action: #selector(pickImage), for: .touchUpInside)

        view.addSubview(borderBox)
        view.addSubview(eventPic)
        view.addSubview(selectFromLibraryButton)
        view.bringSubview(toFront: selectFromLibraryButton)
    }
    
    @objc func pickImage(sender: UIButton!) {
        picker.delegate = self
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        present(picker, animated: true, completion: nil)
    }
    
    func createButtons() {
        let vfw = view.frame.width
        let vfh = view.frame.height
        
        signUpButton = UIButton(frame: CGRect(x: vfw * 0.07, y: vfh * 0.81, width: vfw - 50, height: 40))
        signUpButton.setTitle("Create Post", for: .normal)
        signUpButton.backgroundColor = .orange
        signUpButton.addTarget(self, action: #selector(createPostToFeed), for: .touchUpInside)
        signUpButton.layer.cornerRadius = 10
        
        backToLogin = UIButton(frame: CGRect(x: vfw * 0.07, y: vfh * 0.87, width: vfw - 50, height: 40))
        backToLogin.setTitle("Back To Feed", for: .normal)
        backToLogin.setTitleColor(MDBColor, for: .normal)
        backToLogin.addTarget(self, action: #selector(backToFeed), for: .touchUpInside)
        
        takePictureButton = UIButton(frame: CGRect(x: vfw*0.45, y: vfh*0.25, width: vfw*0.1, height: vfh*0.06))
        takePictureButton.setImage(UIImage(named: "camera"), for: .normal)
        takePictureButton.addTarget(self, action: #selector(selectPictureFromCamera), for: .touchUpInside)
        
        view.addSubview(takePictureButton)
        view.addSubview(backToLogin)
        view.addSubview(signUpButton)
    }
    
    @objc func selectPictureFromCamera() {
        picker.delegate = self
        picker.allowsEditing = false
        picker.sourceType = .camera
        self.present(picker, animated: true, completion: nil)
    }

    @objc func createPostToFeed() {
        let postsRef = Database.database().reference().child("Posts")
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        let imageData = UIImageJPEGRepresentation(eventPic.image!, 0.7)
    postsRef.child("Users" ).child((Auth.auth().currentUser?.uid)!).child("name").observeSingleEvent(of: .value, with: {(snapshot) in
        let date = self.datePickerText.text!
        let time = self.timePickerText.text!
        let posterId = self.posterName.text!
        let postText = self.enterDesc.text!
        let poster = self.posterName.text!
        let numInterested = 0
        let postTitle = self.eventName.text!
        
        var newPost = ["postTitle":postTitle, "date":date, "time":time, "numInterested": numInterested, "text": postText, "poster": poster, "imageUrl": "", "posterId": posterId] as [String : Any]
        let key = postsRef.childByAutoId().key
        let childUpdates = ["/\(key)/": newPost]
        let storage = Storage.storage().reference().child("Posts").child(key)
        storage.putData(imageData!, metadata: metadata, completion: { (metadata, error) in
            if error == nil {
                let imageUrl = metadata?.downloadURL
                newPost["imageUrl"] = imageUrl
                postsRef.updateChildValues(childUpdates)
                self.dismiss(animated: true, completion: nil)
            } else {
                let alert = self.createAlert(warning: error!.localizedDescription)
                self.present(alert, animated: true, completion: nil)
            }
        })
        })
    }
    
    func createAlert(warning: String) -> UIAlertController {
        let alert = UIAlertController(title: "Warning:", message: warning, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        return alert
    }
    
    
    @objc func backToFeed() {
        self.dismiss(animated: true, completion: nil)
    }
}

extension NewSocialVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    //MARK: - Delegates
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        selectFromLibraryButton.removeFromSuperview()
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        eventPic.contentMode = .scaleAspectFit
        eventPic.image = chosenImage
        dismiss(animated:true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
