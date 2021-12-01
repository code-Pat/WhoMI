//
//  HomeCollectionViewCell.swift
//  WhoMI_Demo
//
//  Created by Donggeun Lee on 2021/11/30.
//

import UIKit
import FirebaseCore
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
        /*
        //get image data
        storage.reference(forURL: "gs://whomi-5734d.appspot.com/profileImage").downloadURL { url, error in
            let data = NSData(contentsOf: url!)
            let image = UIImage(data: data! as Data)
            self.imageView.image = image
        }
        */
        //get label data
        let doc1Ref = db.collection("userData").document("owner")
        doc1Ref.addSnapshotListener { [weak self] snapshot, error in
            guard let data1 = snapshot?.data(), error == nil else {
                return
            }
            
            guard let name = data1["name"] as? String? ?? "" else { return }
            guard let phoneNumber = data1["phoneNumber"] as? String? ?? "" else { return }
            
            DispatchQueue.main.async {
                self?.nameLabel.text = name
                self?.mobileLabel.text = phoneNumber
            }
        }
        
        let doc2Ref = db.collection("userData").document("ownerAddition")
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
    
    func setupViews() {
        
        Utilities.imageStyleView(imageView)
        
        Utilities.cellMainStyleLabel(nameLabel)
        Utilities.cellSubStyleLabel(workLabel)
        Utilities.cellSubStyleLabel(mobileLabel)
    }
     
}


