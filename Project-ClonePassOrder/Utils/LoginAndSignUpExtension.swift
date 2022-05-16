//
//  LoginAndSignUpExtension.swift
//  Project-ClonePassOrder
//
//  Created by 정덕호 on 2022/05/16.
//

import SnapKit
import UIKit

extension UIImageView {
    static func welcomePassOrderImage() -> UIImageView {
        let iv = UIImageView()
        iv.image = UIImage(named: "웰컴투패스오더")
        iv.snp.makeConstraints { make in
            make.height.equalTo(100)
        }
        return iv
    }
}

extension UIButton {
    static func emailLoginButton() -> UIButton {
        let bt = UIButton(type: .system)
        bt.tintColor = .black
        bt.setImage(UIImage(systemName: "mail.fill"), for: .normal)
        bt.setTitle(" 이메일로 로그인", for: .normal)
        bt.setTitleColor(.black, for: .normal)
        bt.titleLabel?.font = .systemFont(ofSize: 18)
        bt.layer.borderWidth = 1
        bt.layer.borderColor = UIColor.black.cgColor
        bt.layer.cornerRadius = 10
        bt.snp.makeConstraints { make in
            make.height.equalTo(60)
        }
        return bt
    }
    static func signUpButton() -> UIButton {
        let bt = UIButton(type: .system)
        bt.setTitle("이메일로 회원가입하기", for: .normal)
        bt.setTitleColor(.darkGray, for: .normal)
        bt.titleLabel?.font = .systemFont(ofSize: 16)
        bt.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        return bt
    }
}

extension UITextField {
    static func loginAndSignupTextField(contraintsHeight: Double) -> UITextField {
        let tf = UITextField()
         tf.snp.makeConstraints { make in
             make.height.equalTo(40)
         }
            let sv = UIView()
            sv.backgroundColor = .black
            sv.snp.makeConstraints { make in
                make.height.equalTo(contraintsHeight)
            }
         tf.addSubview(sv)
         sv.snp.makeConstraints { make in
             make.leading.trailing.bottom.equalTo(tf)
         }
         return tf
    }
}

extension UILabel {
    static func loginAndSignupLabel(text: String) -> UILabel {
        let lb = UILabel()
        lb.text = text
        lb.textColor = .black
        lb.font = .systemFont(ofSize: 16)
        return lb
    }
}

extension EmailLoginController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer =
        UITapGestureRecognizer(target: self,
                               action: #selector(EmailLoginController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
