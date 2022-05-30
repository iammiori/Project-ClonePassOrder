//
//  AuthViewModel.swift
//  Project-ClonePassOrder
//
//  Created by 정덕호 on 2022/05/30.
//

import Foundation

protocol AuthViewModelInput {
    func emailTextFieldEmptyVaild(input: String)
}

protocol AuthViewModelOutput {
    var email: Observer<String?> { get set }
}

protocol AuthViewModelProtocol: AuthViewModelInput, AuthViewModelOutput {
}

final class AuthViewModel: AuthViewModelProtocol {
    
    //MARK: - output
    
    var email: Observer<String?> = Observer(value: nil)
}

extension AuthViewModel {
    
    //MARK: - input
    
    func emailTextFieldEmptyVaild(input: String) {
        if input == "" {
            email.value = nil
        } else {
            email.value = input
        }
    }
}
