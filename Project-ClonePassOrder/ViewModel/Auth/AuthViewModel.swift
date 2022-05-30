//
//  AuthViewModel.swift
//  Project-ClonePassOrder
//
//  Created by 정덕호 on 2022/05/30.
//

import Foundation

enum EmptyTextField {
    case emailEmpty
    case passwordEmpty
}

protocol AuthViewModelInput {
    func textFieldEmptyVaild(email: String, password: String)
    func textFieldEmptyString() -> String
    func loginUser()
}

protocol AuthViewModelOutput {
    var email: String? {get set}
    var password: String? {get set}
    var textfildEmpty: Observer<EmptyTextField> {get set}
    var uid: String? {get set}
    var loginError: Observer<LoginError> {get set}
}

protocol AuthViewModelProtocol: AuthViewModelInput, AuthViewModelOutput {
}

final class AuthViewModel: AuthViewModelProtocol {
    
    //MARK: - output
    
    var email: String?
    var password: String?
    var textfildEmpty: Observer<EmptyTextField> = Observer(value: .emailEmpty)
    var uid: String?
    var loginError: Observer<LoginError> = Observer(value: .loginFaildError)
    
    var service: AuthServiceProtocol
    
    init(service: AuthServiceProtocol = AuthService()) {
        self.service = service
    }
}

extension AuthViewModel {
    
    //MARK: - input
    
    func textFieldEmptyVaild(email: String, password: String) {
        if email == "" {
            textfildEmpty.value = .emailEmpty
        } else if password == "" {
            textfildEmpty.value = .passwordEmpty
        } else {
            self.email = email
            self.password = password
        }
    }
    func textFieldEmptyString() -> String {
        switch textfildEmpty.value {
        case .emailEmpty:
            return "아이디를 입력해주세요!"
        case .passwordEmpty:
            return "비빌번호를 입력해주세요!"
        }
    }
    func loginUser() {
        guard let email = email,
            let password = password else {
            return
        }
        service.login(email: email, password: password) { [weak self] result in
            switch result {
            case .success(let uid):
                self?.uid = uid
            case .failure(let error):
                self?.loginError.value = error
            }
        }
    }
    
}
