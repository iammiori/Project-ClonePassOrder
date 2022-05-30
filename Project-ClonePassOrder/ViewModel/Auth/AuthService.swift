//
//  AuthService.swift
//  Project-ClonePassOrder
//
//  Created by 정덕호 on 2022/05/30.
//

import Foundation
import Firebase

enum LoginError: Error {
    var errorMessage: String {
        switch self {
        case .loginFaildError:
            return "아이디와 비밀번호를 확인후 다시 시도해주세요"
        case .authResultNilError:
            return "회원정보를 불러오는것에 실패했습니다 다시 시도해주세요"
        }
    }
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
