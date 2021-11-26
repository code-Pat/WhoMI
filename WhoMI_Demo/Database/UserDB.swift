//
//  UserDB.swift
//  WhoMI_Demo
//
//  Created by Donggeun Lee on 2021/11/26.
//

import Foundation

protocol UserDB {
    func add(usingUserInfo userInfo: UserData) -> Bool
    func update(usingUserInfo userInfo: UserData) -> Void
    func delete(usingId id: String) -> Void
    
}
