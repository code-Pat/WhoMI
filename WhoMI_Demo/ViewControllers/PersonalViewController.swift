//
//  PersonalViewController.swift
//  WhoMI_Demo
//
//  Created by Donggeun Lee on 2021/11/17.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseStorage

class PersonalViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var entireView: UIView!
    //topView
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var settingButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    //stackView
    @IBOutlet weak var stackView: UIStackView!
    //pictureView
    @IBOutlet weak var pictureView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var uploadButton: UIButton!
    //labelView
    @IBOutlet weak var labelView: UIView!
    @IBOutlet weak var sectionLabel: UILabel!
    //nameView
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameCountLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    //birthView
    @IBOutlet weak var birthView: UIView!
    @IBOutlet weak var birthLabel: UILabel!
    @IBOutlet weak var birthCountLabel: UILabel!
    @IBOutlet weak var birthTextField: UITextField!
    //genderView
    @IBOutlet weak var genderView: UIView!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var genderCountLabel: UILabel!
    @IBOutlet weak var genderTextField: UITextField!
    //phoneNumberView
    @IBOutlet weak var phoneNumberView: UIView!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var phoneCountLabel: UILabel!
    @IBOutlet weak var phoneTextField: UITextField!
    //emailView
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailCountLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    //addressView
    @IBOutlet weak var addressView: UIView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var addressCountLabel: UILabel!
    @IBOutlet weak var addressTextField: UITextField!
    //nextView
    @IBOutlet weak var nextView: UIView!
    @IBOutlet weak var nextButton: UIButton!
    
    //bar button
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    //define db and storage
    let db = Firestore.firestore()
    let storage = Storage.storage()
    let imagePickerController = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.isEnabled = false

        setUpViews()
        getDataToTextFields()
    }
    
    
    @IBAction func uploadImgBtnClicked(_ sender: UIButton) {
        
        self.imagePickerController.delegate = self
        self.imagePickerController.sourceType = .photoLibrary
        present(self.imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func nextBtnClicked(_ sender: UIButton) {
        
        let docRef = db.collection("userData").document("owner")
        
        let user: [String:Any] = ["name": nameTextField.text!,
                                  "birthDate": birthTextField.text!,
                            "gender": genderTextField.text!,
                            "phoneNumber": phoneTextField.text!,
                            "email": emailTextField.text!,
                            "address": addressTextField.text!]
        
        docRef.setData(user) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Documnet successfully written!")
            }
        }
        let image = imageView.image
        uploadImage(img: image!)
        
        guard let personal2VC = self.storyboard?.instantiateViewController(withIdentifier: "personal2VC") as? Personal2ViewController else { return }
        self.navigationController?.pushViewController(personal2VC, animated: true)
    }
    
    func getDataToTextFields() {
        
        let docRef = db.collection("userData").document("owner")
        
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
                    
                    self.nameTextField.text! = name
                    self.birthTextField.text! = birthDate
                    self.genderTextField.text! = gender
                    self.phoneTextField.text! = phoneNumber
                    self.emailTextField.text! = email
                    self.addressTextField.text! = address
                }
            }
        }
    }
    
    //image size 조절 필요!! 용량이 너무 크게 올라감
    func uploadImage(img: UIImage) {
        var data = Data()
        data = img.jpegData(compressionQuality: 0.8)!
        let filePath = "profileImage"
        let metaData = StorageMetadata()
        metaData.contentType = "image/png"
        storage.reference().child(filePath).putData(data, metadata: metaData) {
            (metaData, error) in if let error = error {
                print("Error occurred uploading an image: \(error.localizedDescription)")
                return
            }
            else {
                print("successfully uploaded an image")
            }
        }
    }
    
    func downloadImage(imgView: UIImageView) {
        storage.reference(forURL: "gs://whomi-5734d.appspot.com").downloadURL { (url, error) in
            let data = NSData(contentsOf: url!)
            let image = UIImage(data: data! as Data)
            imgView.image = image
        }
    }
}

extension PersonalViewController {
    private func setUpViews() {
        
        //self.entireView.backgroundColor = .black
        
        //topView setup
        Utilities.personalStyleView(topView)
        
        self.settingButton.setImage(UIImage(systemName: "wrench"), for: .normal)
        self.settingButton.setTitle("", for: .normal)
        self.settingButton.contentMode = .scaleAspectFill
        self.settingButton.tintColor = UIColor(named: "smallFontColor")

        self.editButton.setImage(UIImage(systemName: "bandage"), for: .normal)
        self.editButton.setTitle("", for: .normal)
        self.editButton.contentMode = .scaleAspectFill
        self.editButton.tintColor = UIColor(named: "smallFontColor")

        
        //pictureView setup
        Utilities.personalStyleView(pictureView)
        self.pictureView.layer.addBorder([.top, .bottom], color: UIColor(named: "bigFontColor")!, width: 1.0)
        
        Utilities.imageStyleView(imageView)
        
        self.uploadButton.setTitle("이미지 업로드", for: .normal)
        self.uploadButton.tintColor = UIColor(named: "smallFontColor")
        self.uploadButton.layer.borderWidth = 0.5
        self.uploadButton.layer.borderColor = UIColor(named: "smallFontColor")?.cgColor
        
        //labelView setup
        Utilities.personalStyleView(labelView)
        self.labelView.layer.addBorder([.bottom], color: UIColor(named: "bigFontColor")!, width: 1.0)
        
        self.sectionLabel.text = "기본정보"
        Utilities.personalSectionStyleLabel(sectionLabel)
        
        //nameView setup
        Utilities.personalStyleView(nameView)
        
        self.nameLabel.text = "이름"
        Utilities.personalMainStyleLabel(nameLabel)
        
        self.nameCountLabel.text = "0/30"
        Utilities.personalSubStyleLabel(nameCountLabel)
        
        self.nameTextField.placeholder = "이름을 입력하세요"
        
        
        //birthView setup
        Utilities.personalStyleView(birthView)
        
        self.birthLabel.text = "생년월일"
        Utilities.personalMainStyleLabel(birthLabel)
        
        self.birthCountLabel.text = "0/30"
        Utilities.personalSubStyleLabel(birthCountLabel)
        
        self.birthTextField.placeholder = "생년월일을 입력하세요"
            
        //genderView setup
        Utilities.personalStyleView(genderView)
        
        self.genderLabel.text = "성별"
        Utilities.personalMainStyleLabel(genderLabel)
        
        self.genderCountLabel.text = "0/30"
        Utilities.personalSubStyleLabel(genderCountLabel)
        
        self.genderTextField.placeholder = "성별을 입력하세요"
        
        //phoneNumberView setup
        Utilities.personalStyleView(phoneNumberView)
        
        self.phoneNumberLabel.text = "휴대폰번호"
        Utilities.personalMainStyleLabel(phoneNumberLabel)
        
        self.phoneCountLabel.text = "0/30"
        Utilities.personalSubStyleLabel(phoneCountLabel)
        
        self.phoneTextField.placeholder = "휴대폰 번호를 입력하세요"
        
        //emailView setup
        Utilities.personalStyleView(emailView)
        
        self.emailLabel.text = "email주소"
        Utilities.personalMainStyleLabel(emailLabel)
        
        self.emailCountLabel.text = "0/30"
        Utilities.personalSubStyleLabel(emailCountLabel)
        
        self.emailTextField.placeholder = "email주소를 입력하세요"
        
        //addressView setup
        Utilities.personalStyleView(addressView)
        
        self.addressLabel.text = "주소"
        Utilities.personalMainStyleLabel(addressLabel)
        
        self.addressCountLabel.text = "0/30"
        Utilities.personalSubStyleLabel(addressCountLabel)
        
        self.addressTextField.placeholder = "주소를 입력하세요"
        
        //nextView setup
        Utilities.personalStyleView(nextView)
        
        Utilities.personalButton(nextButton)
        
        //right bar button
        
    }
}

extension PersonalViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
