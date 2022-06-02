//
//  UserModel.swift
//  Project-ClonePassOrder
//
//  Created by 정덕호 on 2022/06/01.
//

import Foundation

struct UserModel {
    var userName: String
    var email: String
    var profileImageUrl: String
    
    init(userName: String, email: String, profileImageUrl: String) {
        self.userName = userName
        self.email = email
        self.profileImageUrl = profileImageUrl
    }
}

extension UserModel {
    static let EMPTY = UserModel(userName: "", email: "", profileImageUrl: "")
}
