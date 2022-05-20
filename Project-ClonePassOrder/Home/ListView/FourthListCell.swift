//
//  LastListCell.swift
//  Project-ClonePassOrder
//
//  Created by 정덕호 on 2022/05/20.
//

import UIKit

class FourthListCell: UICollectionViewCell {
    //MARK: - 식별자
    
    static let identifier = "LastListCell"
    
    //MARK: - 프로퍼티
    
    private let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        return view
    }()
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "리스트로보기이미지")
        return iv
    }()
    
    //MARK: - 라이프사이클
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - 메서드
    
    private func setLayout() {
        [separatorView,imageView].forEach {
            self.addSubview($0)
        }
        separatorView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(20)
        }
        imageView.snp.makeConstraints { make in
            make.top.equalTo(separatorView)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(200)
        }
    }
}
