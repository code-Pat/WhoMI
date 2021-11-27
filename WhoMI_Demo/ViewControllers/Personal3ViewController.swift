//
//  Personal3ViewController.swift
//  WhoMI_Demo
//
//  Created by Donggeun Lee on 2021/11/23.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseFirestoreSwift

class Personal3ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var entireView: UIView!
    //stackView
    @IBOutlet weak var stackView: UIStackView!
    //sectionView
    @IBOutlet weak var sectionView: UIView!
    @IBOutlet weak var sectionLabel: UILabel!
    //statusView
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var statusCountLabel: UILabel!
    @IBOutlet weak var statusTextField: UITextField!
    //introduceView
    @IBOutlet weak var introduceView: UIView!
    @IBOutlet weak var introduceLabel: UILabel!
    @IBOutlet weak var introduceTextView: UITextView!
    
    //bar button
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpViews()
    }
    
    @IBAction func saveBtnClicked(_ sender: UIButton) {
        let db = Firestore.firestore()
    
        let userIntro: [String:Any] = [
            "status": statusTextField.text!,
            "introduce": introduceTextView.text!
                                  ]
        
        let docRef = db.collection("userData").document("ownerIntro")
        docRef.setData(userIntro) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Documnet successfully written!")
            }
        }
        
        navigationController?.popToRootViewController(animated: true)
    }
    

}

extension Personal3ViewController {
    private func setUpViews() {
        //entireView setup
        Utilities.personalStyleView(entireView)
        
        //sectionView setup
        Utilities.personalStyleView(sectionView)
        
        self.sectionLabel.text = "나를 소개하자"
        Utilities.personalSectionStyleLabel(sectionLabel)
        
        //statusView setup
        Utilities.personalStyleView(statusView)
        
        self.statusLabel.text = "나를 소개하는 한 줄"
        Utilities.personalMainStyleLabel(statusLabel)
        
        self.statusCountLabel.text = "0/250"
        Utilities.personalSubStyleLabel(statusCountLabel)
        
        self.statusTextField.placeholder = "나를 소개하는 한 줄을 입력해주세요"
        
        //introduceView setup
        Utilities.personalStyleView(introduceView)
        
        self.introduceLabel.text = "기본 소개"
        Utilities.personalMainStyleLabel(introduceLabel)
        
    }
}
