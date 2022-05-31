//
//  SignUpViewModel.swift
//  Project-ClonePassOrder
//
//  Created by 정덕호 on 2022/05/31.
//

import Foundation
import UIKit

protocol SignUpViewModelInput {
    func profileImageConrvertData(image: UIImage)
    func textFieldEmptyVaild(text: String)
    func textFieldEmptyString() -> String?
    func userNameToLongValid(userName: String) -> Bool
}

protocol SignUpViewModelOutput {
    var textFieldEmpty: Observer<Bool> {get set}
    var profileImageData: Data? {get set}
    var userName: String {get set}
}

protocol SignUpViewModelProtocol: SignUpViewModelInput, SignUpViewModelOutput {
    
}

//MARK: - input

final class SignUpViewModel: SignUpViewModelProtocol {
    
    static let shared: SignUpViewModel = SignUpViewModel()
    
    var textFieldEmpty: Observer<Bool> = Observer(value: false)
    var profileImageData: Data? = nil
    var userName: String = ""
}

//MARK: - output

extension SignUpViewModel {
    func profileImageConrvertData(image: UIImage) {
        guard let imageData = image.jpegData(compressionQuality: 1) else {
            return
        }
        self.profileImageData = imageData
    }
    func textFieldEmptyVaild(text: String) {
        if text == "" {
            textFieldEmpty.value = false
        } else {
            textFieldEmpty.value = true
        }
    }
    func textFieldEmptyString() -> String? {
        if textFieldEmpty.value == false {
            return "입력해주세요!"
        } else {
            return nil
        }
    }
    func userNameToLongValid(userName: String) -> Bool {
        if userName.count < 9 {
            self.userName = userName
            return true
        } else {
            return false
        }
    }
}
