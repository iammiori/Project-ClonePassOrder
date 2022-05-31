//
//  MockSignUpService.swift
//  Project-ClonePassOrder
//
//  Created by 정덕호 on 2022/05/31.
//

import Foundation

struct MockSignUpService: SignUpServiceProtocol {
    
    var result: Result<Void, SigunUpError>?
    
    func signUp(model: SignUpModel, completion: @escaping (Result<Void, SigunUpError>) -> Void) {
        completion(result!)
    }
}
