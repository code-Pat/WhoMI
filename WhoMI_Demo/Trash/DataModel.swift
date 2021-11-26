//
//  DataModel.swift
//  WhoMI_Demo
//
//  Created by Donggeun Lee on 2021/11/24.
//

/*
 - Address 부분 다시 확인해서 사용하기.
 - 휴대폰 번호, 웹사이트 들어가는 부분 형식 다시 확인하기.
 - 성별은 bool 타입으로 할지 고려해보기
 - 생년월일도 date형식 재정의하기
 */

/*
import Foundation
import RealmSwift

class UserBasicInfo: Object {
    @Persisted var name: String
    @Persisted var birthDate: Date = Date(timeIntervalSince1970: 1)
    @Persisted var gender: String
    @Persisted var phoneNumber: Int
    @Persisted var email: String
    @Persisted var address: Address?
    @Persisted var nickName: String
    
    @Persisted(primaryKey: true) var _id: ObjectId
    
    convenience init(name: String, birthDate: Date, gender: String, phoneNumber: Int, email: String, address: Address, nickName: String) {
        self.init()
        self.name = name
        self.birthDate = birthDate
        self.gender = gender
        self.phoneNumber = phoneNumber
        self.email = email
        self.address = address
        self.nickName = nickName
    }
}

class UserAddtionalInfo: Object {
    @Persisted var github: String
    @Persisted var blog: String
    @Persisted var youtube: String
    @Persisted var website: String
    
    @Persisted var education: String
    @Persisted var work: String
    
    @Persisted var develope: String
    @Persisted var language: String
    
    @Persisted var hobby: String
    @Persisted var interest: String
    
    @Persisted var workPhoneNumber: Int
    
    @Persisted var oneLine: String
    @Persisted var introduce: String
}

class Address: EmbeddedObject {
    @Persisted var unit: String
    @Persisted var street: String
    @Persisted var gu: String
    @Persisted var city: String
    @Persisted var country: String
    @Persisted var zipcode: String
}
*/
