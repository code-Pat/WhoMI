//
//  QRScannerView.swift
//  WhoMI_Demo
//
//  Created by Donggeun Lee on 2021/12/29.
//

import SwiftUI
import CodeScanner

struct QRScannerView: View {
    @State var isPresentingScanner = true
    @State var scannedCode: String = "상대방의 QR을 스캔해주세요"
    
    var scannerSheet: some View {
        CodeScannerView(codeTypes: [.qr]) { response in
            if case let .success(result) = response {
                scannedCode = result.string
                isPresentingScanner = false
            }
        }
    }
    
    var body: some View {
        VStack(spacing: 10) {
            Text(scannedCode)
            
            .sheet(isPresented: $isPresentingScanner) {
                self.scannerSheet
            }
        }
    }
}

struct QRScannerView_Previews: PreviewProvider {
    static var previews: some View {
        QRScannerView()
    }
}
