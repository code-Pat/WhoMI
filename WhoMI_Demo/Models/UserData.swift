//
//  UserData.swift
//  WhoMI_Demo
//
//  Created by Donggeun Lee on 2021/11/25.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct UserData: Codable {
    // essential data
    var name: String
    var birthDate: String
    var gender: String
    var phoneNumber: String
    var email: String
    var address: String
    var photo: URL
    
    
    //additional data
    var github: String?
    var blog: String?
    var youtube: String?
    var website: String?
    var education: String?
    var work: String?
    var develope: String?
    var language: String?
    var hobby: String?
    var interests: String?
    var workPhone: String?
    var status: String?
    var introduce: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case birthDate
        case gender
        case phoneNumber
        case email
        case address
        case photo
        
        case github
        case blog
        case youtube
        case website
        case education
        case work
        case develope
        case language
        case hobby
        case interests
        case workPhone
        case status
        case introduce
    }
}

extension UserData {
    static func imageURL(forName name: String) -> URL {
        let number = (abs(name.hashValue) % 22) + 1
        let URLString = "gs://whomi-5734d.appspot.com/\(number)"
        return URL(string: URLString)!
    }
    
    var imageURL: URL {
        return UserData.imageURL(forName: name)
    }
}
