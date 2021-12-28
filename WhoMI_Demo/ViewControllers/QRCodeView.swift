//
//  QRCodeView.swift
//  WhoMI_Demo
//
//  Created by Donggeun Lee on 2021/12/28.
//

import Foundation
import SwiftUI
import CoreImage.CIFilterBuiltins
import FirebaseAuth

struct QRCodeView: View {
    let userAuth = Auth.auth().currentUser
    
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    var body: some View {
        Image(uiImage: generateQRCodeImage())
            .interpolation(.none)
            .resizable()
            .frame(width: 200, height: 200, alignment: .center)
    }
    
    func generateQRCodeImage() -> UIImage {
        if let userAuth = userAuth {
            let data = userAuth.uid
            filter.setValue(data, forKey: "inputMessage")
        }
        if let qrCodeImage = filter.outputImage {
            if let qrCodeCGImage = context.createCGImage(qrCodeImage, from: qrCodeImage.extent) {
                return UIImage(cgImage: qrCodeCGImage)
            }
        }
        return UIImage(systemName: "xmark") ?? UIImage()
    }
}
