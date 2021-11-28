//
//  PersonalProfileViewController.swift
//  WhoMI_Demo
//
//  Created by Donggeun Lee on 2021/11/17.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseFirestoreSwift

class PersonalProfileViewController: UIViewController {
    
    //scroll View
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var entireView: UIView!
    @IBOutlet weak var stackView: UIStackView!
    //top View
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var settingButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    //main section View
    @IBOutlet weak var mainSectionView: UIView!
    @IBOutlet weak var mainSectionLabel: UILabel!
    //image show View
    @IBOutlet weak var imageShowView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    //status View
    @IBOutlet weak var statusView: UIView!
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
    
    //define db
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}

extension PersonalProfileViewController {
    private func setUpViews() {
        
        //topView setup
        Utilities.profileStyleView(topView)
        
        self.settingButton.setTitle("setting", for: .normal)
        self.settingButton.contentMode = .scaleAspectFill
        self.settingButton.tintColor = UIColor.white
        
        self.editButton.setTitle("edit", for: .normal)
        self.editButton.contentMode = .scaleAspectFill
        self.editButton.tintColor = UIColor.white
        
        //mainSectionView setup
        Utilities.profileStyleView(mainSectionView)
        
        Utilities.profileSectionStyleLabel(mainSectionLabel)
        self.mainSectionLabel.text = "나의 프로필"
        
        //imageShowView setup
        Utilities.profileStyleView(imageShowView)
        
        //statusView setup
        Utilities.profileStyleView(statusView)
        
        Utilities.profileInfoStyleLabel(statusLabel)
        self.statusLabel.text = "여기다가 내가 쓰고 싶은 한 줄을 쓰면 됨."
        
        //basicSectionView setup
        Utilities.profileStyleView(basicSectionView)
        
        Utilities.profileSectionStyleLabel(basicSectionLabel)
        self.basicSectionLabel.text = "기본 정보"
        
        //basicInfoView setup
        Utilities.profileStyleView(basicInfoView)
        
        Utilities.profileInfoStyleLabel(nameLabel)
        
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
