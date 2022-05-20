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
    }
}
