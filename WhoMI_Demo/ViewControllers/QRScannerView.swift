//
//  QRScannerView.swift
//  WhoMI_Demo
//
//  Created by Donggeun Lee on 2021/12/29.
//

import SwiftUI
import CodeScanner
import Firebase
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift
import simd



struct QRScannerView: View {
    let db = Firestore.firestore()
    
    @State var isPresentingScanner = true
    @State var scannedCode: String = "상대방의 QR을 스캔해주세요"
    @Environment(\.presentationMode) var presentationMode
    
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
            Text("친구 추가가 완료되었습니다!")
            
            Button(("친구 추가를 하시겠습니다?"), action: {
                addFriend()
                self.presentationMode.wrappedValue.dismiss()
            })
            .sheet(isPresented: $isPresentingScanner) {
                self.scannerSheet
            }
        }
        
    }
    
    func addFriend() {
        let userAuth = Auth.auth().currentUser
        if let userAuth = userAuth {
            let docRef = db.collection("\(userAuth.uid)").document("friends")
            
            let friend: [String: Any] = ["friend": String(scannedCode)]
            docRef.setData(friend) { err in
                if let err = err {
                    print("Error writing document: \(err)")
                } else {
                    print("Document successfully written")
                }
            }
        }
    }
}

struct QRScannerView_Previews: PreviewProvider {
    static var previews: some View {
        QRScannerView()
    }
}
