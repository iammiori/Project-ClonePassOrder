//
//  SignUpContractController.swift
//  Project-ClonePassOrder
//
//  Created by 정덕호 on 2022/05/16.
//

import UIKit

class SignUpContractController: UIViewController {

    //MARK: - 프로퍼티
    
    private let textField: UITextField =
    UITextField().signUpTextField(text: "이메일",placeholder: "passorder@gmail.com")
    private let welcomeView: UIView = UIView().welcomeView()
    
    //MARK: - 라이프사이클

    override func viewDidLoad() {
        super.viewDidLoad()
        naviSetAttribute()
        setLayout()
        setAtrribute()
    }
    
    //MARK: - 메서드
    
    private func setLayout() {
        self.welcomViewSetLayout(view: view, welcomeView: welcomeView)
        self.textFieldSetLayout(view: view, textField: textField, topView: welcomeView)
    }
    private func setAtrribute() {
        view.backgroundColor = .white
    }
    private func naviSetAttribute() {
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.topItem?.title = ""
        navigationController?.navigationBar.tintColor = .black
    }
}
