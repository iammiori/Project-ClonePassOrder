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
}

protocol AuthViewModelOutput {
    var email: String? {get set}
    var password: String? {get set}
    var textfildEmpty: Observer<EmptyTextField> {get set}
}

protocol AuthViewModelProtocol: AuthViewModelInput, AuthViewModelOutput {
}

final class AuthViewModel: AuthViewModelProtocol {
    
    //MARK: - output
    
    var email: String?
    var password: String?
    var textfildEmpty: Observer<EmptyTextField> = Observer(value: .emailEmpty)
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
    
}
