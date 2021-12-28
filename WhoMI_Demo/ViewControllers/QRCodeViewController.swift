//
//  QRCodeViewController.swift
//  WhoMI_Demo
//
//  Created by Donggeun Lee on 2021/12/28.
//

import UIKit
import SnapKit

class QRCodeViewController: UIViewController {
    
    var uiView: UIView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    private func setupLayout() {
        view.addSubview(uiView)
        
        uiView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(300)
            make.center.equalTo(self.view)
            make.height.equalTo(300)
            make.width.equalTo(300)
            
        }
    }
    

}
