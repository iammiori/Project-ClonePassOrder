//
//  UserViewModel.swift
//  Project-ClonePassOrder
//
//  Created by 정덕호 on 2022/06/01.
//

import Foundation

protocol UserViewModelInput {
    func userFetch(uid: String)
}

protocol UserViewModelOutput {
    var model: Observer<UserModel> {get set}
    var userName: String {get}
    var profileImageUrl: URL? {get}
    var userServiceError: Observer<UserServiceError> {get set}
    var userImageFetchEnd: Observer<Bool> {get set}
}

protocol UserViewModelProtocol: UserViewModelInput, UserViewModelOutput {
    
}


final class UserViewModel: UserViewModelProtocol {
    
    static let shared = UserViewModel()
    
    var userService: UserServiceProtocol
    
    //MARK: - outPut
    
    var model: Observer<UserModel> = Observer(value: UserModel.EMPTY)
    var userName: String {
        return model.value.userName
    }
    var profileImageUrl: URL? {
        return URL(string: model.value.profileImageUrl)
    }
    var userServiceError: Observer<UserServiceError> = Observer(value: .snapShotError)
    var userImageFetchEnd: Observer<Bool> = Observer(value: false)
    
    init(service: UserServiceProtocol = UserService()) {
        self.userService = service
    }
}


extension UserViewModel {
    
    //MARK: - input
    func userFetch(uid: String) {
        userService.fetch(uid: uid) { [weak self] result in
            switch result {
            case .success(let model):
                self!.model.value = model
            case .failure(let error):
                self!.userServiceError.value = error
            }
        }
    }
}
