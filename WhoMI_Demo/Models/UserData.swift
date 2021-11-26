//
//  UserData.swift
//  WhoMI_Demo
//
//  Created by Donggeun Lee on 2021/11/25.
//

import Foundation

struct UserData: Codable {
    let name: String
    let birthDate: String
    let gender: String
    let phoneNumber: String
    let email: String
    let address: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case birthDate
        case gender
        case phoneNumber
        case email
        case address
    }
}
