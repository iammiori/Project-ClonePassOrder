//
//  MockAuthService.swift
//  Project-ClonePassOrder
//
//  Created by 정덕호 on 2022/05/30.
//

import Foundation

struct MockAuthService: AuthServiceProtocol {
    var loginResult: Result<String,LoginError>?
    
    func login(
        email: String,
        password: String,
        completion: @escaping (Result<String, LoginError>) -> Void
    ) {
        completion(loginResult!)
    }
    
}
