//
//  ListCellFooter.swift
//  Project-ClonePassOrder
//
//  Created by 정덕호 on 2022/05/19.
//

import UIKit

class ListCellFooter: UICollectionReusableView {
    
    //MARK: - 식별자
    
    static let identifier = "ListCellFooter"
    
    //MARK: - 프로퍼티
    
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
}
