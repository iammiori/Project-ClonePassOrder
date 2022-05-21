//
//  MyPasserHeader.swift
//  Project-ClonePassOrder
//
//  Created by 정덕호 on 2022/05/21.
//

import UIKit

class MyPasserHeader: UITableViewHeaderFooterView {
    
    //MARK: - 식별자
    
    static let identifier: String = "MyPasserHeader"
    
    //MARK: - 프로퍼티
    
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .lightGray
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 1
        return iv
    }()
    private let label: UILabel = {
        let lb = UILabel()
        lb.text = "정덕호"
        lb.textColor = .black
        lb.font = .boldSystemFont(ofSize: 20)
        return lb
    }()
    
    //MARK: - 라이프사이클
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setLayout()
        setAtrribute()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - 메서드
    
    private func setLayout() {
        
    }
    private func setAtrribute() {
    }
}
