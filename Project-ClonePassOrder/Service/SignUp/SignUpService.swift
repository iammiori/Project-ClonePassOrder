//
//  SignUpService.swift
//  Project-ClonePassOrder
//
//  Created by 정덕호 on 2022/05/31.
//

import Foundation
import Firebase

enum SigunUpError: Error {
    
    case signUpFaildError
    case resultNillError
    case upLoadFireStoreError
}

protocol SignUpServiceProtocol {
    func signUp(model: SignUpModel, completion: @escaping (Result<Void,SigunUpError>) -> Void)
}

struct SignUpService: SignUpServiceProtocol {
    func signUp(model: SignUpModel, completion: @escaping (Result<Void, SigunUpError>) -> Void) {
        Auth.auth().createUser(
            withEmail: model.email,
            password: model.password
        ) { result, error in
            if error != nil {
                completion(.failure(.signUpFaildError))
            } else {
                guard let result = result else {
                    completion(.failure(.resultNillError))
                    return
                }
                let data: [String: Any] = [
                    "email": model.email,
                    "userName": model.userName,
                    "prifileImageURL": model.profileImageURL,
                    "나의약관동의": model.is14YearsOld,
                    "서비스제공동의": model.isAgreeService,
                    "위치정보제공동의": model.isAgreeLocationService,
                    "개인정보제공동의": model.isAgreePrivacyInformation,
                    "개인정보 제3자 제공동의": model.isAgreePrivacyThirdPartyInformation,
                    "마케팅약관동의": model.isAgreeMarketingReceive
                ]
                Firestore.firestore().collection("user").document(result.user.uid).setData(data) { error in
                    if error != nil {
                        completion(.failure(.upLoadFireStoreError))
                    } else {
                        completion(.success(()))
                    }
                }
            }
        }
    }

}
