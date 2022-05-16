//
//  LoginController.swift
//  Project-ClonePassOrder
//
//  Created by 정덕호 on 2022/05/16.
//

import UIKit
import SnapKit

class LoginController: UIViewController {
    
    //MARK: - 프로퍼티
    
    private let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "패스오더로그인이미지")
        return iv
    }()
    private let kakaoTalkLoginButton: UIButton = {
        let bt = UIButton(type: .system)
        bt.backgroundColor = .systemYellow
        bt.tintColor = .black
        bt.setImage(UIImage(systemName: "message.fill"), for: .normal)
        bt.setTitle(" 3초만에 카카오톡으로 로그인", for: .normal)
        bt.setTitleColor(.black, for: .normal)
        bt.titleLabel?.font = .systemFont(ofSize: 18)
        bt.layer.cornerRadius = 10
        bt.snp.makeConstraints { make in
            make.height.equalTo(60)
        }
        bt.addTarget(self, action: #selector(kakaoTalkLoginButtonTapped), for: .touchUpInside)
        return bt
    }()
    private let orLabel: UILabel = {
        let lb = UILabel()
        lb.text = "OR"
        lb.textColor = .darkGray
        lb.font = .systemFont(ofSize: 18)
        lb.textAlignment = .center
        return lb
    }()
    private let emailLoginButton: UIButton = {
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
        bt.addTarget(self, action: #selector(emailLoginButtonTapped), for: .touchUpInside)
        return bt
    }()
    private let signupButton: UIButton = {
        let bt = UIButton(type: .system)
        bt.setTitle("이메일로 회원가입하기", for: .normal)
        bt.setTitleColor(.darkGray, for: .normal)
        bt.titleLabel?.font = .systemFont(ofSize: 16)
        bt.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        bt.addTarget(self, action: #selector(emailSignupButtonTapped), for: .touchUpInside)
        return bt
    }()
    private lazy var loginStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews:
                                [kakaoTalkLoginButton,
                                 orLabel,
                                 emailLoginButton,
                                 signupButton])
        sv.axis = .vertical
        sv.spacing = 15
        return sv
    }()
    
    //MARK: - 라이프사이클
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAtrribute()
        setLayout()
    }
    override func viewWillAppear(_ animated: Bool) {
        setNavigationAttribute()
    }
    
    //MARK: - 셀렉터메서드
    @objc private func kakaoTalkLoginButtonTapped() {
        
    }
    @objc private func emailLoginButtonTapped() {
        
    }
    @objc private func emailSignupButtonTapped() {
        
    }
    
    //MARK: - 메서드
    
    private func setLayout() {
        view.addSubview(logoImageView)
        logoImageView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(view.snp.top)
            make.bottom.equalTo(view.snp.bottomMargin)
        }
        view.addSubview(loginStackView)
        loginStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalTo(view.snp.bottomMargin)
        }
        
    }
    private func setAtrribute() {
        view.backgroundColor = .white
    }
    private func setNavigationAttribute() {
        navigationController?.navigationBar.isHidden = true
    }
}
