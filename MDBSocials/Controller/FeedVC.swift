//
//  FeedVC.swift
//  MDBSocials
//
//  Created by Ethan Wong on 2/20/18.
//  Copyright © 2018 Ethan Wong. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class FeedVC: UIViewController {
    var posts: [Post] = []
    var auth = Auth.auth()
    var postView: UICollectionView!
    var postsRef: DatabaseReference = Database.database().reference().child("Posts")
    var storage: StorageReference = Storage.storage().reference()
    var currentUser: Users?
    var currPost: Post!
    var navBar: UINavigationBar!
    let MDBColor = UIColor(red:0.16, green:0.73, blue:1.00, alpha:1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        activityIndicator.startAnimating()
        setUpNavBar()
        setUpCollectionView()
        getAndChangePosts()
        activityIndicator.stopAnimating()
    
    }
    
    func getAndChangePosts() {
        let ref = Database.database().reference()
        ref.child("Posts").observe(.childAdded, with: { (snapshot) in
            let post = Post(id: snapshot.key, postDict: snapshot.value as! [String : Any]?)
            self.posts.insert(post, at: 0)
            self.postView.reloadData()
        
        })
        ref.child("Posts").observe(.childChanged, with: { (snapshot) in
            self.postView.reloadData()
        })
    }
    
    func setUpNavBar(){
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "New Event", style: .plain, target: self, action: #selector(toNewSocial))
        self.navigationItem.rightBarButtonItem?.tintColor = .orange
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .plain, target: self, action: #selector(signOut))
        self.navigationItem.leftBarButtonItem?.tintColor = .orange
        self.title = "Your Feed"
    }
    
    @objc func toNewSocial() {
        performSegue(withIdentifier: "toNewSocial", sender: self)
    }
    
    @objc func signOut() {
        try! Auth.auth().signOut()
        performSegue(withIdentifier: "toLogin", sender: self)
    }
    
    func setUpCollectionView(){
        let frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        let cvLayout = UICollectionViewFlowLayout()
        postView = UICollectionView(frame: frame, collectionViewLayout: cvLayout)
        postView.delegate = self
        postView.dataSource = self
        postView.register(FeedViewCell.self, forCellWithReuseIdentifier: "post")
        postView.backgroundColor = MDBColor
        view.addSubview(postView)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetails" {
            let detailVC = segue.destination as! DetailVC
            detailVC.currPost = currPost
        }
    }
    
}

extension FeedVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "post", for: indexPath) as! FeedViewCell
        cell.awakeFromNib()
        let postInQuestion = posts[indexPath.row]
        cell.postText.text = postInQuestion.text
        cell.posterText.text = postInQuestion.poster
        cell.numInterested.text = String(describing: postInQuestion.numInterested!)
        cell.dateText.text = postInQuestion.date
        cell.timeText.text = postInQuestion.time
        cell.layer.borderWidth = 1.0
        cell.layer.masksToBounds = true
        cell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        cell.layer.shadowRadius = 2.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        cell.layer.cornerRadius = 10
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.layer.cornerRadius).cgPath
        return cell
    }
    
    override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        return CGSize(width: postView.bounds.width - 20, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 20, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        currPost = posts[indexPath.row]
        performSegue(withIdentifier: "toDetails", sender: self)
    }
}

