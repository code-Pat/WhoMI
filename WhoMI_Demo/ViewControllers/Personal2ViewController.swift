//
//  Personal2ViewController.swift
//  WhoMI_Demo
//
//  Created by Donggeun Lee on 2021/11/23.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class Personal2ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var entireView: UIView!
    //stackView
    @IBOutlet weak var stackView: UIStackView!
    //labelView
    @IBOutlet weak var labelView: UIView!
    @IBOutlet weak var sectionLabel: UILabel!
    //githubView
    @IBOutlet weak var githubView: UIView!
    @IBOutlet weak var githubLabel: UILabel!
    @IBOutlet weak var githubTextField: UITextField!
    //blogView
    @IBOutlet weak var blogView: UIView!
    @IBOutlet weak var blogLabel: UILabel!
    @IBOutlet weak var blogTextField: UITextField!
    //youtubeView
    @IBOutlet weak var youtubeView: UIView!
    @IBOutlet weak var youtubeLabel: UILabel!
    @IBOutlet weak var youtubeTextField: UITextField!
    //websiteView
    @IBOutlet weak var websiteView: UIView!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var websiteTextField: UITextField!
    //educationView
    @IBOutlet weak var educationView: UIView!
    @IBOutlet weak var educationLabel: UILabel!
    @IBOutlet weak var educationTextField: UITextField!
    //workView
    @IBOutlet weak var workView: UIView!
    @IBOutlet weak var workLabel: UILabel!
    @IBOutlet weak var workTextField: UITextField!
    //developeView
    @IBOutlet weak var developeView: UIView!
    @IBOutlet weak var developeLabel: UILabel!
    @IBOutlet weak var developeTextField: UITextField!
    //languageView
    @IBOutlet weak var languageView: UIView!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var languageTextField: UITextField!
    //hobbyView
    @IBOutlet weak var hobbyView: UIView!
    @IBOutlet weak var hobbyLabel: UILabel!
    @IBOutlet weak var hobbyTextField: UITextField!
    //interestView
    @IBOutlet weak var interestView: UIView!
    @IBOutlet weak var interestLabel: UILabel!
    @IBOutlet weak var interestTextField: UITextField!
    //phonenumView
    @IBOutlet weak var phonenumView: UIView!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var phoneTextField: UITextField!
    //nextView
    @IBOutlet weak var nextView: UIView!
    @IBOutlet weak var nextButton: UIButton!
    

    
    //define db
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpViews()
        getDataToTextFields()
    }
    
    @IBAction func nextBtnClicked(_ sender: UIButton) {
        let userAuth = Auth.auth().currentUser
        if let userAuth = userAuth {
            let docRef = db.collection("\(userAuth.uid)").document("ownerAddition")
            let userAdd: [String:Any] = ["github": githubTextField.text!,
                                      "blog": blogTextField.text!,
                                      "youtube": youtubeTextField.text!,
                                      "website": websiteTextField.text!,
                                      "education": educationTextField.text!,
                                      "work": workTextField.text!,
                                      "develope": developeTextField.text!,
                                      "language": languageTextField.text!,
                                      "hobby": hobbyTextField.text!,
                                      "interests": interestTextField.text!,
                                      "workPhone": phoneTextField.text!
                                      ]
            
            docRef.setData(userAdd) { err in
                if let err = err {
                    print("Error writing document: \(err)")
                } else {
                    print("Documnet successfully written!")
                }
            }
        }
        
        guard let personal3VC = self.storyboard?.instantiateViewController(withIdentifier: "personal3VC") as? Personal3ViewController else { return }
        self.navigationController?.pushViewController(personal3VC, animated: true)
    }
    
    func getDataToTextFields() {
        
        let userAuth = Auth.auth().currentUser
        if let userAuth = userAuth {
            let docRef = db.collection("\(userAuth.uid)").document("ownerAddition")
            
            docRef.getDocument { document, error in
                if let error = error as NSError? {
                    print("Error getting document: \(error.localizedDescription)")
                }
                else {
                    if let document = document {
                        let data = document.data()
                        let github = data?["github"] as? String ?? ""
                        let blog = data?["blog"] as? String ?? ""
                        let youtube = data?["youtube"] as? String ?? ""
                        let website = data?["website"] as? String ?? ""
                        let education = data?["education"] as? String ?? ""
                        let work = data?["work"] as? String ?? ""
                        let develope = data?["develope"] as? String ?? ""
                        let language = data?["language"] as? String ?? ""
                        let hobby = data?["hobby"] as? String ?? ""
                        let interests = data?["interests"] as? String ?? ""
                        let workPhone = data?["workPhone"] as? String ?? ""
                        
                        self.githubTextField.text! = github
                        self.blogTextField.text! = blog
                        self.youtubeTextField.text! = youtube
                        self.websiteTextField.text! = website
                        self.educationTextField.text! = education
                        self.workTextField.text! = work
                        self.developeTextField.text! = develope
                        self.languageTextField.text! = language
                        self.hobbyTextField.text! = hobby
                        self.interestTextField.text! = interests
                        self.phoneTextField.text! = workPhone
                    }
                }
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
}

extension Personal2ViewController {
    private func setUpViews() {
        
        //labelView setup
        Utilities.personalStyleView(labelView)
        self.labelView.layer.addBorder([.bottom], color: UIColor(named: "bigFontColor")!, width: 1.0)
        
        self.sectionLabel.text = "????????????"
        Utilities.personalSectionStyleLabel(sectionLabel)
        
        //githubView setup
        Utilities.personalStyleView(githubView)
        
        self.githubLabel.text = "Github"
        Utilities.personalMainStyleLabel(githubLabel)
        
        self.githubTextField.placeholder = "github ????????? ???????????????"
        
        //blogView setup
        Utilities.personalStyleView(blogView)
        
        self.blogLabel.text = "Blog"
        Utilities.personalMainStyleLabel(blogLabel)
        
        self.blogTextField.placeholder = "blog ????????? ???????????????"
        
        //youtubeView setup
        Utilities.personalStyleView(youtubeView)
        
        self.youtubeLabel.text = "Youtube"
        Utilities.personalMainStyleLabel(youtubeLabel)

        self.youtubeTextField.placeholder = "youtube ????????? ???????????????"
        
        //websiteView setup
        Utilities.personalStyleView(websiteView)
        
        self.websiteLabel.text = "Website"
        Utilities.personalMainStyleLabel(websiteLabel)

        self.websiteTextField.placeholder = "website ????????? ???????????????"
        
        //educationView setup
        Utilities.personalStyleView(educationView)
        
        self.educationLabel.text = "??????"
        Utilities.personalMainStyleLabel(educationLabel)

        self.educationTextField.placeholder = "????????? ???????????????"
        
        //workView setup
        Utilities.personalStyleView(workView)
        
        self.workLabel.text = "??????"
        Utilities.personalMainStyleLabel(workLabel)

        self.workTextField.placeholder = "????????? ???????????????"
        
        //developeView setup
        Utilities.personalStyleView(developeView)
        
        self.developeLabel.text = "?????? ?????? ??????"
        Utilities.personalMainStyleLabel(developeLabel)
    
        self.developeTextField.placeholder = "?????? ????????? ???????????????"
        
        //languageView setup
        Utilities.personalStyleView(languageView)
        
        self.languageLabel.text = "????????? ??????"
        Utilities.personalMainStyleLabel(languageLabel)
       
        self.languageTextField.placeholder = "????????? ????????? ???????????????"
        
        //hobbyView setup
        Utilities.personalStyleView(hobbyView)
        
        self.hobbyLabel.text = "??????"
        Utilities.personalMainStyleLabel(hobbyLabel)

        self.hobbyTextField.placeholder = "????????? ???????????????"
        
        //interestView setup
        Utilities.personalStyleView(interestView)
        
        self.interestLabel.text = "?????? ??????"
        Utilities.personalMainStyleLabel(interestLabel)
  
        self.interestTextField.placeholder = "??????????????? ???????????????"
        
        //phonenumView setup
        Utilities.personalStyleView(phonenumView)
        
        self.phoneLabel.text = "??????(?????????) ??????"
        Utilities.personalMainStyleLabel(phoneLabel)
        
        self.phoneTextField.placeholder = "?????? ????????? ???????????????"
        
        //nextView setup
        Utilities.personalStyleView(nextView)
        
        Utilities.personalButton(nextButton)
    }
}
