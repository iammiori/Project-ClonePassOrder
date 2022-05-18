//
//  FistADCell.swift
//  Project-ClonePassOrder
//
//  Created by 정덕호 on 2022/05/18.
//

import SnapKit
import UIKit

class FirstADCell: UICollectionViewCell {
    
    //MARK: - 식별자
    
    static let identifier: String = "FirstADCell"
    
    //MARK: - 프로퍼티
    
    private let scrollView: UIScrollView = UIScrollView()
    
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
        self.addSubview(scrollView)
        scrollView.backgroundColor = .blue
        scrollView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
    }
    

    
}
