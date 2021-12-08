//
//  PersonalProfileViewController.swift
//  WhoMI_Demo
//
//  Created by Donggeun Lee on 2021/11/17.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseStorage

class PersonalProfileViewController: UIViewController {
    
    //scroll View
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var entireView: UIView!
    @IBOutlet weak var stackView: UIStackView!
    //top View
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var editButton: UIButton!
    //main section View
    @IBOutlet weak var mainSectionView: UIView!
    @IBOutlet weak var mainSectionLabel: UILabel!
    //image show View
    @IBOutlet weak var imageShowView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    //status View
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var statusIcon: UIButton!
    @IBOutlet weak var statusLabel: UILabel!
    //basic section View
    @IBOutlet weak var basicSectionView: UIView!
    @IBOutlet weak var basicSectionLabel: UILabel!
    //basic info View
    @IBOutlet weak var basicInfoView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthDateLabel: UILabel!
    @IBOutlet weak var birthDateInfoLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var addressInfoLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var genderInfoLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailInfoLabel: UILabel!
    @IBOutlet weak var mobileLabel: UILabel!
    @IBOutlet weak var mobileInfoLabel: UILabel!
    //add section View
    @IBOutlet weak var addSectionView: UIView!
    @IBOutlet weak var addSectionLabel: UILabel!
    //add info View
    @IBOutlet weak var addInfoView: UIView!
    @IBOutlet weak var githubLabel: UILabel!
    @IBOutlet weak var githubInfoLabel: UILabel!
    @IBOutlet weak var blogLabel: UILabel!
    @IBOutlet weak var blogInfoLabel: UILabel!
    @IBOutlet weak var youtubeLabel: UILabel!
    @IBOutlet weak var youtubeInfoLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var websiteInfoLabel: UILabel!
    @IBOutlet weak var educationLabel: UILabel!
    @IBOutlet weak var educationInfoLabel: UILabel!
    @IBOutlet weak var workLabel: UILabel!
    @IBOutlet weak var workInfoLabel: UILabel!
    @IBOutlet weak var developeLabel: UILabel!
    @IBOutlet weak var developeInfoLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var languageInfoLabel: UILabel!
    @IBOutlet weak var hobbyLabel: UILabel!
    @IBOutlet weak var hobbyInfoLabel: UILabel!
    @IBOutlet weak var interestsLabel: UILabel!
    @IBOutlet weak var interestsInfoLabel: UILabel!
    @IBOutlet weak var workPhoneLabel: UILabel!
    @IBOutlet weak var workPhoneInfoLabel: UILabel!
    
    //define db and storage
    let db = Firestore.firestore()
    let storage = Storage.storage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setUpViews()
        getImageData()
        getEssentialData()
        getAdditionalData()
        getIntroData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getImageData()
    }
    
    @IBAction func editBtnClicked(_ sender: UIButton) {
        guard let personalVC = self.storyboard?.instantiateViewController(withIdentifier: "personalVC") as? PersonalViewController else { return }
        self.navigationController?.pushViewController(personalVC, animated: true)
    }
    
    @IBAction func settingBtnClicked(_ sender: UIButton) {
        guard let settingVC = self.storyboard?.instantiateViewController(withIdentifier: "settingVC") as? SettingViewController else { return }
        self.navigationController?.pushViewController(settingVC, animated: true)
    }
    
    func getImageData() {
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
        }
    }
    
    func getEssentialData() {
        let userAuth = Auth.auth().currentUser
        if let userAuth = userAuth {
            let docRef = db.collection("\(userAuth.uid)").document("owner")
            
            docRef.addSnapshotListener { [weak self] snapshot, error in
                guard let data = snapshot?.data(), error == nil else {
                    return
                }
                
                guard let name = data["name"] as? String? ?? "" else { return }
                guard let birthDate = data["birthDate"] as? String? ?? "" else { return }
                guard let gender = data["gender"] as? String? ?? "" else { return }
                guard let phoneNumber = data["phoneNumber"] as? String? ?? "" else { return }
                guard let email = data["email"] as? String? ?? "" else { return }
                guard let address = data["address"] as? String? ?? "" else { return }
                
                DispatchQueue.main.async {
                    self?.nameLabel.text = name
                    self?.birthDateInfoLabel.text = birthDate
                    self?.genderInfoLabel.text = gender
                    self?.workPhoneInfoLabel.text = phoneNumber
                    self?.emailInfoLabel.text = email
                    self?.addressInfoLabel.text = address
                }
            }
        }
    }
    
    func getAdditionalData() {
        let userAuth = Auth.auth().currentUser
        if let userAuth = userAuth {
            let docRef = db.collection("\(userAuth.uid)").document("ownerAddition")
            
            docRef.addSnapshotListener { [weak self] snapshot, error in
                guard let data = snapshot?.data(), error == nil else {
                    return
                }
                
                guard let github = data["github"] as? String? ?? "" else { return }
                guard let blog = data["blog"] as? String? ?? "" else { return }
                guard let youtube = data["youtube"] as? String? ?? "" else { return }
                guard let website = data["website"] as? String? ?? "" else { return }
                guard let education = data["education"] as? String? ?? "" else { return }
                guard let work = data["work"] as? String? ?? "" else { return }
                guard let develope = data["develope"] as? String? ?? "" else { return }
                guard let language = data["language"] as? String? ?? "" else { return }
                guard let hobby = data["hobby"] as? String? ?? "" else { return }
                guard let interests = data["interests"] as? String? ?? "" else { return }
                guard let workPhone = data["workPhone"] as? String? ?? "" else { return }
                
                DispatchQueue.main.async {
                    self?.githubInfoLabel.text = github
                    self?.blogInfoLabel.text = blog
                    self?.youtubeInfoLabel.text = youtube
                    self?.websiteInfoLabel.text = website
                    self?.educationInfoLabel.text = education
                    self?.workInfoLabel.text = work
                    self?.developeInfoLabel.text = develope
                    self?.languageInfoLabel.text = language
                    self?.hobbyInfoLabel.text = hobby
                    self?.interestsInfoLabel.text = interests
                    self?.workPhoneInfoLabel.text = workPhone
                    
                }
            }
        }
    }
    
    func getIntroData() {
        let userAuth = Auth.auth().currentUser
        if let userAuth = userAuth {
            let docRef = db.collection("\(userAuth.uid)").document("ownerIntro")
            
            docRef.addSnapshotListener { [weak self] snapshot, error in
                guard let data = snapshot?.data(), error == nil else {
                    return
                }
                
                guard let status = data["status"] as? String? ?? "" else { return }
                
                DispatchQueue.main.async {
                    self?.statusLabel.text = status
                }
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
}

extension PersonalProfileViewController {
    private func setUpViews() {
        
        //topView setup
        Utilities.profileStyleView(topView)
        
        self.editButton.setTitle("", for: .normal)
        self.editButton.setImage(UIImage(systemName: "square.and.pencil"), for: .normal)
        self.editButton.contentMode = .scaleToFill
        self.editButton.tintColor = UIColor(named: "smallFontColor")
        self.editButton.titleLabel?.font = UIFont(name: "helvetica", size: 10)
        
        //mainSectionView setup
        Utilities.profileStyleView(mainSectionView)
        self.mainSectionView.layer.addBorder([.bottom], color: UIColor(named: "bigFontColor")!, width: 1.0)
        
        Utilities.profileSectionStyleLabel(mainSectionLabel)
        self.mainSectionLabel.text = "나의 프로필"
        
        //imageShowView setup
        Utilities.profileStyleView(imageShowView)
        
        Utilities.imageStyleView(imageView)
        
        //statusView setup
        Utilities.profileStyleView(statusView)
        
        self.statusIcon.setImage(UIImage(systemName: "sparkles"), for: .normal)
        self.statusIcon.setTitle("", for: .normal)
        self.statusIcon.tintColor = .systemYellow
        
        Utilities.profileInfoStyleLabel(statusLabel)
        self.statusLabel.text = "나를 소개하는 한 줄"
        self.statusLabel.contentMode = .center
        
        //basicSectionView setup
        Utilities.profileStyleView(basicSectionView)
        self.basicSectionView.layer.addBorder([.top], color: UIColor(named: "bigFontColor")!, width: 1.0)
        Utilities.profileSectionStyleLabel(basicSectionLabel)
        self.basicSectionLabel.text = "기본 정보"
        
        //basicInfoView setup
        Utilities.profileStyleView(basicInfoView)
        self.basicInfoView.layer.addBorder([.top, .bottom], color: UIColor(named: "bigFontColor")!, width: 1.0)
        
        Utilities.profileNameStyleLabel(nameLabel)
        
        Utilities.profileTitleStyleLabel(birthDateLabel)
        Utilities.profileInfoStyleLabel(birthDateInfoLabel)
        Utilities.profileTitleStyleLabel(addressLabel)
        Utilities.profileInfoStyleLabel(addressInfoLabel)
        Utilities.profileTitleStyleLabel(genderLabel)
        Utilities.profileInfoStyleLabel(genderInfoLabel)
        Utilities.profileTitleStyleLabel(emailLabel)
        Utilities.profileInfoStyleLabel(emailInfoLabel)
        Utilities.profileTitleStyleLabel(mobileLabel)
        Utilities.profileInfoStyleLabel(mobileInfoLabel)
        
        //addSectionView setup
        Utilities.profileStyleView(addSectionView)
        
        Utilities.profileSectionStyleLabel(addSectionLabel)
        self.addSectionLabel.text = "부가 정보"
        
        //addInfoView setup
        Utilities.profileStyleView(addInfoView)
        self.addInfoView.layer.addBorder([.top, .bottom], color: UIColor(named: "bigFontColor")!, width: 1.0)
        
        Utilities.profileTitleStyleLabel(githubLabel)
        Utilities.profileInfoStyleLabel(githubInfoLabel)
        Utilities.profileTitleStyleLabel(blogLabel)
        Utilities.profileInfoStyleLabel(blogInfoLabel)
        Utilities.profileTitleStyleLabel(youtubeLabel)
        Utilities.profileInfoStyleLabel(youtubeInfoLabel)
        Utilities.profileTitleStyleLabel(websiteLabel)
        Utilities.profileInfoStyleLabel(websiteInfoLabel)
        Utilities.profileTitleStyleLabel(educationLabel)
        Utilities.profileInfoStyleLabel(educationInfoLabel)
        Utilities.profileTitleStyleLabel(workLabel)
        Utilities.profileInfoStyleLabel(workInfoLabel)
        Utilities.profileTitleStyleLabel(developeLabel)
        Utilities.profileInfoStyleLabel(developeInfoLabel)
        Utilities.profileTitleStyleLabel(languageLabel)
        Utilities.profileInfoStyleLabel(languageInfoLabel)
        Utilities.profileTitleStyleLabel(hobbyLabel)
        Utilities.profileInfoStyleLabel(hobbyInfoLabel)
        Utilities.profileTitleStyleLabel(interestsLabel)
        Utilities.profileInfoStyleLabel(interestsInfoLabel)
        Utilities.profileTitleStyleLabel(workPhoneLabel)
        Utilities.profileInfoStyleLabel(workPhoneInfoLabel)
        
        
        
    }
}

/*
docRef.getDocument { document, error in
    if let error = error as NSError? {
        print("Error getting document: \(error.localizedDescription)")
    }
    else {
        if let document = document {
            let data = document.data()
            let name = data?["name"] as? String ?? ""
            let birthDate = data?["birthDate"] as? String ?? ""
            let gender = data?["gender"] as? String ?? ""
            let phoneNumber = data?["phoneNumber"] as? String ?? ""
            let email = data?["email"] as? String ?? ""
            let address = data?["address"] as? String ?? ""
            
            self.nameLabel.text = name
            self.birthDateInfoLabel.text = birthDate
            self.genderInfoLabel.text = gender
            self.workPhoneInfoLabel.text = phoneNumber
            self.emailInfoLabel.text = email
            self.addressInfoLabel.text = address
        }
    }
}
 */

/*
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
            
            self.githubInfoLabel.text! = github
            self.blogInfoLabel.text! = blog
            self.youtubeInfoLabel.text! = youtube
            self.websiteInfoLabel.text! = website
            self.educationInfoLabel.text! = education
            self.workInfoLabel.text! = work
            self.developeInfoLabel.text! = develope
            self.languageInfoLabel.text! = language
            self.hobbyInfoLabel.text! = hobby
            self.interestsInfoLabel.text! = interests
            self.workPhoneInfoLabel.text! = workPhone
        }
    }
}
 */

/*
docRef.getDocument { document, error in
    if let error = error as NSError? {
        print("Error getting document: \(error.localizedDescription)")
    }
    else {
        if let document = document {
            let data = document.data()
            let status = data?["status"] as? String ?? ""
            
            self.statusLabel.text! = status
        }
    }
}
 */
