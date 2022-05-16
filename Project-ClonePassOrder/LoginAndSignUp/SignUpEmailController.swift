//
//  SignUpEmailController.swift
//  Project-ClonePassOrder
//
//  Created by 정덕호 on 2022/05/16.
//

import UIKit

class SignUpEmailController: UIViewController {
    
    //MARK: - 프로퍼티
    
    private let textField: UITextField =
    UITextField().signUpTextField(text: "이메일",placeholder: "passorder@gmail.com")
    private let welcomeView: UIView = UIView().welcomeView()
    private let nextButton: UIButton = UIButton().nextButton()
    
    //MARK: - 라이프사이클

    override func viewDidLoad() {
        super.viewDidLoad()
        naviSetAttribute()
        setLayout()
        setAtrribute()
    }
    
    //MARK: - 셀렉터메서드
    
    @objc private func nextButtonTapped() {
        pushNextView()
    }
    
    //MARK: - 메서드
    
    private func setLayout() {
        self.welcomViewSetLayout(view: view, welcomeView: welcomeView)
        self.textFieldSetLayout(view: view, textField: textField, topView: welcomeView)
        self.nextButtonSetLayout(view: view, button: nextButton, topView: textField)
    }
    private func setAtrribute() {
        view.backgroundColor = .white
        textField.delegate = self
        textField.becomeFirstResponder()
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }
    private func naviSetAttribute() {
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.topItem?.title = ""
        navigationController?.navigationBar.tintColor = .black
    }
    private func pushNextView() {
        navigationController?.pushViewController(SignUpPasswordController(), animated: true)
    }
}

//MARK: - 텍스트필드 델리게이트

extension SignUpEmailController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushNextView()
        return true
    }
}
