//
//  ListCellFooter.swift
//  Project-ClonePassOrder
//
//  Created by 정덕호 on 2022/05/19.
//

import UIKit

enum FooterSection {
    case FirstCell
    case SecondCell
    case ThirdCell
}

class ListCellFooter: UICollectionReusableView {
    
    //MARK: - 식별자
    
    static let identifier = "ListCellFooter"
    
    //MARK: - 프로퍼티
    
     var currentSection: FooterSection = .FirstCell
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "arrow.right")
        iv.tintColor = .lightGray
        iv.alpha = 0.6
        return iv
    }()
    private let moreButton: UIButton = {
        let bt = UIButton(type: .system)
        bt.setTitle("더보기", for: .normal)
        bt.setTitleColor(.black, for: .normal)
        bt.titleLabel?.font = .systemFont(ofSize: 16)
        return bt
    }()
    
    //MARK: - 라이프사이클
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
        setAtrribute()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - 셀렉터메서드
    
    @objc private func moreButtonTapped() {
        switch currentSection {
        case .FirstCell:
            print("첫번째셀")
        case .SecondCell:
            print("두번째셀")
        case .ThirdCell:
            print("세번째셀")
        }
    }
    
    //MARK: - 메서드
    
    private func setLayout() {
        [imageView,moreButton].forEach {
            self.addSubview($0)
        }
        imageView.snp.makeConstraints { make in
            make.bottom.trailing.equalToSuperview().inset(20)
            make.width.equalTo(60)
            make.height.equalTo(40)
        }
        moreButton.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(imageView)
            make.width.equalTo(60)
            make.height.equalTo(40)
        }
    }
    private func setAtrribute() {
        moreButton.addTarget(self, action: #selector(moreButtonTapped), for: .touchUpInside)
    }
}
