//
//  AuthService.swift
//  Project-ClonePassOrder
//
//  Created by 정덕호 on 2022/05/30.
//

import Foundation
import Firebase

enum LoginError: Error {
    case loginFaildError
    case authResultNilError
}

protocol AuthServiceProtocol {
    func login(
        email: String,
        password: String,
        completion: @escaping (Result<String,LoginError>) -> Void
    )
}

struct AuthService: AuthServiceProtocol {
    func login(
        email: String,
        password: String,
        completion: @escaping (Result<String,LoginError>) -> Void
    ) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if error != nil {
                completion(.failure(.loginFaildError))
            } else {
                guard let result = authResult else {
                    completion(.failure(.authResultNilError))
                    return
                }
                completion(.success(result.user.uid))
            }
        }
    }
}
