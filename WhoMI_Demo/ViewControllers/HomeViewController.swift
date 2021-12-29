//
//  HomeViewController.swift
//  WhoMI_Demo
//
//  Created by Donggeun Lee on 2021/11/17.
//

import UIKit

class HomeViewController: UIViewController {
    

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var sectionView: UIView!
    @IBOutlet weak var sectionLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var friendButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.backgroundColor = UIColor(named: "backgroundColorCollection")
        self.collectionView.layer.opacity = 0.8
    
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        setUpViews()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.collectionView.reloadData()
    }
    
    @IBAction func addBtnClicked(_ sender: UIButton) {
        guard let personalVC = self.storyboard?.instantiateViewController(withIdentifier: "personalVC") as? PersonalViewController else { return }
        self.navigationController?.pushViewController(personalVC, animated: true)
    }
    
    @IBAction func friendBtnClicked(_ sender: UIButton) {
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as? HomeCollectionViewCell else { return UICollectionViewCell() }
        
        cell.setup()
        cell.setupViews()
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160, height: 210)
    }
    
}

extension HomeViewController {
    private func setUpViews() {
        
        Utilities.personalStyleView(sectionView)
        self.sectionView.layer.addBorder([.bottom], color: UIColor(named: "bigFontColor")!, width: 1.0)
        
        self.addButton.setImage(UIImage(systemName: "person"), for: .normal)
        self.addButton.setTitle("", for: .normal)
        self.addButton.contentMode = .scaleAspectFill
        self.addButton.tintColor = UIColor(named: "smallFontColor")
        
        self.friendButton.setImage(UIImage(systemName: "qrcode.viewfinder"), for: .normal)
        self.friendButton.setTitle("", for: .normal)
        self.friendButton.contentMode = .scaleAspectFill
        self.friendButton.tintColor = UIColor(named: "smallFontColor")
        
        self.sectionLabel.text = "전체"
        Utilities.personalSectionStyleLabel(sectionLabel)
    }
}

