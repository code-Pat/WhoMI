//
//  HomeCollectionViewCell.swift
//  WhoMI_Demo
//
//  Created by Donggeun Lee on 2021/11/30.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseStorage

class HomeCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "homeCell"
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var workLabel: UILabel!
    @IBOutlet weak var mobileLabel: UILabel!
    
   
    
    let db = Firestore.firestore()
    let storage = Storage.storage()
    
    func setup() {
        
        //get image data
        let userAuth = Auth.auth().currentUser
        if let userAuth = userAuth {
            storage.reference(forURL: "gs://whomi-5734d.appspot.com/\(userAuth.uid)").downloadURL { (url, error) in
                if let error = error {
                    self.imageView.image = UIImage(named: "sampleImage")
                    print("Error downloading an image...\(error.localizedDescription)")
                } else {
                    let data = NSData(contentsOf: url!)
                    let image = UIImage(data: data! as Data)
                    self.imageView.image = image
                }
            }
            //get label data
            let docRef = db.collection("\(userAuth.uid)").document("owner")
            docRef.addSnapshotListener { [weak self] snapshot, error in
                guard let data = snapshot?.data(), error == nil else {
                    return
                }
                
                guard let name = data["name"] as? String? ?? "" else { return }
                guard let phoneNumber = data["phoneNumber"] as? String? ?? "" else { return }
                
                DispatchQueue.main.async {
                    self?.nameLabel.text = name
                    self?.mobileLabel.text = phoneNumber
                }
            }
            let doc2Ref = db.collection("\(userAuth.uid)").document("ownerAddition")
            doc2Ref.addSnapshotListener {  [weak self] snapshot, error in
                guard let data2 = snapshot?.data(), error == nil else {
                    return
                }
                guard let work = data2["work"] as? String? ?? "" else { return }
                
                DispatchQueue.main.async {
                    self?.workLabel.text = work
                    
                }
            }
        }
    }
    
    func setupViews() {
        
        Utilities.imageStyleView(imageView)
        
        Utilities.cellMainStyleLabel(nameLabel)
        Utilities.cellSubStyleLabel(workLabel)
        Utilities.cellSubStyleLabel(mobileLabel)
    }
     
}


