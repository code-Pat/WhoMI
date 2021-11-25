//
//  Personal2ViewController.swift
//  WhoMI_Demo
//
//  Created by Donggeun Lee on 2021/11/23.
//

import UIKit

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
    @IBOutlet weak var githubCountLabel: UILabel!
    @IBOutlet weak var githubTextField: UITextField!
    //blogView
    @IBOutlet weak var blogView: UIView!
    @IBOutlet weak var blogLabel: UILabel!
    @IBOutlet weak var blogCountLabel: UILabel!
    @IBOutlet weak var blogTextField: UITextField!
    //youtubeView
    @IBOutlet weak var youtubeView: UIView!
    @IBOutlet weak var youtubeLabel: UILabel!
    @IBOutlet weak var youtubeCountLabel: UILabel!
    @IBOutlet weak var youtubeTextField: UITextField!
    //websiteView
    @IBOutlet weak var websiteView: UIView!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var websiteCountLabel: UILabel!
    @IBOutlet weak var websiteTextField: UITextField!
    //educationView
    @IBOutlet weak var educationView: UIView!
    @IBOutlet weak var educationLabel: UILabel!
    @IBOutlet weak var educationCountLabel: UILabel!
    @IBOutlet weak var educationTextField: UITextField!
    //workView
    @IBOutlet weak var workView: UIView!
    @IBOutlet weak var workLabel: UILabel!
    @IBOutlet weak var workCountLabel: UILabel!
    @IBOutlet weak var workTextField: UITextField!
    //developeView
    @IBOutlet weak var developeView: UIView!
    @IBOutlet weak var developeLabel: UILabel!
    @IBOutlet weak var developeCountLabel: UILabel!
    @IBOutlet weak var developeTextField: UITextField!
    //languageView
    @IBOutlet weak var languageView: UIView!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var languageCountLabel: UILabel!
    @IBOutlet weak var languageTextField: UITextField!
    //hobbyView
    @IBOutlet weak var hobbyView: UIView!
    @IBOutlet weak var hobbyLabel: UILabel!
    @IBOutlet weak var hobbyCountLabel: UILabel!
    @IBOutlet weak var hobbyTextField: UITextField!
    //interestView
    @IBOutlet weak var interestView: UIView!
    @IBOutlet weak var interestLabel: UILabel!
    @IBOutlet weak var interestCountLabel: UILabel!
    @IBOutlet weak var interestTextField: UITextField!
    //phonenumView
    @IBOutlet weak var phonenumView: UIView!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var phoneCountLabel: UILabel!
    @IBOutlet weak var phoneTextField: UITextField!
    //nextView
    @IBOutlet weak var nextView: UIView!
    @IBOutlet weak var nextButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViews()

    }
    
    @IBAction func nextBtnClicked(_ sender: UIButton) {
        guard let personal3VC = self.storyboard?.instantiateViewController(withIdentifier: "personal3VC") as? Personal3ViewController else { return }
        self.navigationController?.pushViewController(personal3VC, animated: true)
    }
    
}

extension Personal2ViewController {
    private func setUpViews() {
        
        //labelView setup
        Utilities.personalStyleView(labelView)
        
        self.sectionLabel.text = "부가정보"
        Utilities.personalSectionStyleLabel(sectionLabel)
        
        //githubView setup
        Utilities.personalStyleView(githubView)
        
        self.githubLabel.text = "Github"
        Utilities.personalMainStyleLabel(githubLabel)
        
        self.githubCountLabel.text = "0/100"
        Utilities.personalSubStyleLabel(githubCountLabel)
        
        self.githubTextField.placeholder = "github 주소를 입력하세요"
        
        //blogView setup
        Utilities.personalStyleView(blogView)
        
        self.blogLabel.text = "Blog"
        Utilities.personalMainStyleLabel(blogLabel)
        
        self.blogCountLabel.text = "0/100"
        Utilities.personalSubStyleLabel(blogCountLabel)
        
        self.blogTextField.placeholder = "blog 주소를 입력하세요"
        
        //youtubeView setup
        Utilities.personalStyleView(youtubeView)
        
        self.youtubeLabel.text = "Youtube"
        Utilities.personalMainStyleLabel(youtubeLabel)
        
        self.youtubeCountLabel.text = "0/100"
        Utilities.personalSubStyleLabel(youtubeCountLabel)
        
        self.youtubeTextField.placeholder = "youtube 주소를 입력하세요"
        
        //websiteView setup
        Utilities.personalStyleView(websiteView)
        
        self.websiteLabel.text = "Website"
        Utilities.personalMainStyleLabel(websiteLabel)
        
        self.websiteCountLabel.text = "0/100"
        Utilities.personalSubStyleLabel(websiteCountLabel)
        
        self.websiteTextField.placeholder = "website 주소를 입력하세요"
        
        //educationView setup
        Utilities.personalStyleView(educationView)
        
        self.educationLabel.text = "학교"
        Utilities.personalMainStyleLabel(educationLabel)
        
        self.educationCountLabel.text = "0/100"
        Utilities.personalSubStyleLabel(educationCountLabel)
        
        self.educationTextField.placeholder = "학교를 입력하세요"
        
        //workView setup
        Utilities.personalStyleView(workView)
        
        self.workLabel.text = "직장"
        Utilities.personalMainStyleLabel(workLabel)
        
        self.workCountLabel.text = "0/100"
        Utilities.personalSubStyleLabel(workCountLabel)
        
        self.workTextField.placeholder = "직장을 입력하세요"
        
        //developeView setup
        Utilities.personalStyleView(developeView)
        
        self.developeLabel.text = "개발 가능 언어"
        Utilities.personalMainStyleLabel(developeLabel)
        
        self.developeCountLabel.text = "0/100"
        Utilities.personalSubStyleLabel(developeCountLabel)
        
        self.developeTextField.placeholder = "개발 언어를 입력하세요"
        
        //languageView setup
        Utilities.personalStyleView(languageView)
        
        self.languageLabel.text = "외국어 능력"
        Utilities.personalMainStyleLabel(languageLabel)
        
        self.languageCountLabel.text = "0/100"
        Utilities.personalSubStyleLabel(languageCountLabel)
        
        self.languageTextField.placeholder = "외국어 능력을 입력하세요"
        
        //hobbyView setup
        Utilities.personalStyleView(hobbyView)
        
        self.hobbyLabel.text = "취미"
        Utilities.personalMainStyleLabel(hobbyLabel)
        
        self.hobbyCountLabel.text = "0/100"
        Utilities.personalSubStyleLabel(hobbyCountLabel)
        
        self.hobbyTextField.placeholder = "취미를 입력하세요"
        
        //interestView setup
        Utilities.personalStyleView(interestView)
        
        self.interestLabel.text = "관심 분야"
        Utilities.personalMainStyleLabel(interestLabel)
        
        self.interestCountLabel.text = "0/100"
        Utilities.personalSubStyleLabel(interestCountLabel)
        
        self.interestTextField.placeholder = "관심분야를 입력하세요"
        
        //phonenumView setup
        Utilities.personalStyleView(phonenumView)
        
        self.phoneLabel.text = "직장(업무용) 번호"
        Utilities.personalMainStyleLabel(phoneLabel)
        
        self.phoneCountLabel.text = "0/100"
        Utilities.personalSubStyleLabel(phoneCountLabel)
        
        self.phoneTextField.placeholder = "직장 번호를 입력하세요"
        
        //nextView setup
        Utilities.personalStyleView(nextView)
        
        Utilities.personalButton(nextButton)
    }
}
