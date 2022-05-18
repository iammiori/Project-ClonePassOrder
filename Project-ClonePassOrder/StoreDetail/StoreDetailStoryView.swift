//
//  StoreDetailStoryView.swift
//  Project-ClonePassOrder
//
//  Created by Eunsoo KIM on 2022/05/17.
//

import UIKit

class StoreDetailStoryView: UIView {
    let storyCollectionView: UICollectionView = {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(
            frame: CGRect.zero,
            collectionViewLayout: collectionViewFlowLayout
        )
        collectionView.backgroundColor = .red
        collectionView.isScrollEnabled = false
        collectionView.register(
            StoryCollectionViewCell.classForCoder(),
            forCellWithReuseIdentifier: "cellID"
        )
        return collectionView
    }()
    
    // MARK: - initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setDelegate()
        setAtrribute()
        setLayout()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    // MARK: - setAtrribute
    
    private func setAtrribute() {
    }
    
    // MARK: - setLayout
    
    private func setLayout() {
        self.backgroundColor = .systemGroupedBackground
    }
}

extension StoreDetailStoryView: UICollectionViewDelegate {
    
}
