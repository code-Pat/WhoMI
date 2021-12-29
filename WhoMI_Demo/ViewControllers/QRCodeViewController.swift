//
//  QRCodeViewController.swift
//  WhoMI_Demo
//
//  Created by Donggeun Lee on 2021/12/28.
//

import Foundation
import SwiftUI

struct QRCodeViewController: View {
    var body: some View {
        VStack {
            
            QRCodeView()
            Text("프로필 공유를 위해 위 QR코드를 이용하세요")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        QRCodeViewController()
    }
}



/*
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
*/
