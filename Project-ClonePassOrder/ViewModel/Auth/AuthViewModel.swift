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
    func logoutUser()
}

protocol AuthViewModelOutput {
    var email: String? {get set}
    var password: String? {get set}
    var textfildEmpty: Observer<EmptyTextField> {get set}
    var uid: Observer<String?> {get set}
    var authError: Observer<AuthError> {get set}
    var loginStart: Observer<Bool> {get set}
    var logoutSuccess: Observer<Bool> {get set}
}

protocol AuthViewModelProtocol: AuthViewModelInput, AuthViewModelOutput {
}

final class AuthViewModel: AuthViewModelProtocol {
    
    //MARK: - output
    
    var service: AuthServiceProtocol
    
    var email: String?
    var password: String?
    var textfildEmpty: Observer<EmptyTextField> = Observer(value: .emailEmpty)
    var uid: Observer<String?> = Observer(value: nil)
    var authError: Observer<AuthError> = Observer(value: .loginFaildError)
    var loginStart: Observer<Bool> = Observer(value: false)
    var logoutSuccess: Observer<Bool> = Observer(value: false)
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
            loginUser()
            loginStart.value = true
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
                self?.uid.value = uid
            case .failure(let error):
                self?.authError.value = error
            }
        }
    }
    func logoutUser() {
       try? service.logout { [weak self] result in
           switch result {
           case .success():
               self?.logoutSuccess.value = true
           case .failure(let error):
               self?.authError.value = error
           }
        }
    }
    
}
