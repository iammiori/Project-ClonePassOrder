//
//  EmailLoginController.swift
//  Project-ClonePassOrder
//
//  Created by 정덕호 on 2022/05/16.
//

import SnapKit
import UIKit

class EmailLoginController: UIViewController {
    
    //MARK: - 프로퍼티
    
    private let emailLoginButton: UIButton = UIButton.emailLoginButton()
    private let signupButton: UIButton = UIButton.signUpButton()
    private let emailTextField: UITextField =
    UITextField.loginAndSignupTextField(contraintsHeight: 0.8)
    private let emailLabel: UILabel = UILabel.loginAndSignupLabel(text: "아이디")
    private let passwordTextField: UITextField =
    UITextField.loginAndSignupTextField(contraintsHeight: 0.8)
    private let passwordLabel: UILabel = UILabel.loginAndSignupLabel(text: "비밀번호")
    private let welcomePassOrderImage: UIImageView = UIImageView.welcomePassOrderImage()
    
    //MARK: - 라이프사이클
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        naviSetAttribute()
        setAtrribute()
        setLayout()
        keyBoardNotificationSet()
    }
    override func viewDidDisappear(_ animated: Bool) {
        keyBoardNotificationUnSet()
    }
    
    //MARK: - 셀렉터메서드
    @objc func emailLoginButtonTapped() {
        
    }
    @objc func signupButtonTapped() {
        
    }
    @objc func keyboardWillShow(_ sender: Notification) {
        if let keyboardFrame: NSValue =
            sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            self.view.frame.origin.y = -(keyboardFrame.cgRectValue.height)
        }
    }
    @objc func keyboardWillHide(_ sender: Notification) {
        self.view.frame.origin.y = 0
    }
    
    //MARK: - 메서드
    private func setLayout() {
        view.addSubview(welcomePassOrderImage)
        welcomePassOrderImage.snp.makeConstraints { make in
            make.top.equalTo(view.snp.topMargin)
            make.leading.trailing.equalToSuperview()
        }
        view.addSubview(signupButton)
        signupButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalTo(view.snp.bottomMargin)
        }
        view.addSubview(emailLoginButton)
        emailLoginButton.snp.makeConstraints { make in
            make.bottom.equalTo(signupButton.snp.top).offset(-15)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        view.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { make in
            make.bottom.equalTo(emailLoginButton.snp.top).offset(-60)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        view.addSubview(passwordLabel)
        passwordLabel.snp.makeConstraints { make in
            make.centerY.equalTo(passwordTextField)
            make.leading.equalTo(passwordTextField)
        }
        view.addSubview(emailTextField)
        emailTextField.snp.makeConstraints { make in
            make.bottom.equalTo(passwordTextField.snp.top).offset(-20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        view.addSubview(emailLabel)
        emailLabel.snp.makeConstraints { make in
            make.centerY.equalTo(emailTextField)
            make.leading.equalTo(emailTextField)
        }
    }
    private func setAtrribute() {
        view.backgroundColor = .white
        emailTextField.delegate = self
        passwordTextField.delegate = self
        emailLoginButton.addTarget(self,
                                   action: #selector(emailLoginButtonTapped),
                                   for: .touchUpInside)
        signupButton.addTarget(self, action: #selector(signupButtonTapped), for: .touchUpInside)
    }
    private func naviSetAttribute() {
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.topItem?.title = ""
        navigationController?.navigationBar.tintColor = .black
    }
    private func textFieldBeginEditingLabelsetLayout(textfield: UITextField) {
        switch textfield {
        case emailTextField:
            emailLabel.snp.updateConstraints { make in
                make.centerY.equalTo(emailTextField).offset(-20)
            }
            emailLabel.font = .systemFont(ofSize: 14)
        case passwordTextField:
            passwordLabel.snp.updateConstraints { make in
                make.centerY.equalTo(passwordTextField).offset(-20)
            }
            passwordLabel.font = .systemFont(ofSize: 14)
        default:
            break
        }
    }
    private func textFieldBeginEndEditingLabelsetLayout(textfield: UITextField) {
        switch textfield {
        case emailTextField:
            emailLabel.snp.updateConstraints { make in
                make.centerY.equalTo(emailTextField)
            }
            emailLabel.font = .systemFont(ofSize: 16)
        case passwordTextField:
            passwordLabel.snp.updateConstraints { make in
                make.centerY.equalTo(passwordTextField)
            }
            passwordLabel.font = .systemFont(ofSize: 16)
        default:
            break
        }
    }
    private func keyBoardNotificationSet() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide(_:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    private func keyBoardNotificationUnSet() {
        NotificationCenter.default.removeObserver(self,
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.removeObserver   (self,
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
}

//MARK: - 텍스트필드 델리게이트
extension EmailLoginController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textFieldBeginEditingLabelsetLayout(textfield: textField)
    }
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        textFieldBeginEndEditingLabelsetLayout(textfield: textField)
    }
}
