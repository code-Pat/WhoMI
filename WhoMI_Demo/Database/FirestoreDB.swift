//
//  FirestoreDB.swift
//  WhoMI_Demo
//
//  Created by Donggeun Lee on 2021/11/26.
//

import Foundation
import FirebaseCore
import FirebaseFirestore
//import Firebase
import FirebaseFirestoreSwift


class FirestoreDB {
    
    private let firebaseDB = Firestore.firestore()
    static let shared: FirestoreDB = FirestoreDB()
    private let userCollection = "user"
    
    private init() { }
}
/*
extension FirestoreDB: UserDB {
    func add(usingUserInfo userInfo: UserData) -> Bool {
        do {
            let ref = try firebaseDB.collection(userCollection).addDocument(data: userInfo)
            print("Add document succeed with id = \(ref.documentID)")

        } catch let error {
            print("Add document failed: \(error)")
            return false
        }
        return true
    }
    
    func update(usingUserInfo userInfo: UserData) {
        <#code#>
    }
    
    func delete(usingId id: String) {
        <#code#>
    }
    
    
}
*/
