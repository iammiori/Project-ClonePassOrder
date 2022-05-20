//
//  SearchCollectionViewController.swift
//  Project-ClonePassOrder
//
//  Created by 정덕호 on 2022/05/20.
//

import UIKit

class SearchCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setAtrribute()
    }
    
    //MARK: - 메서드
    private func setAtrribute() {
        collectionView.register(SortCell.self, forCellWithReuseIdentifier: SortCell.identifier)
    }

    //MARK: - 컬렉션뷰 데이터소스

    override func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return 0
    }
    override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: SortCell.identifier,
            for: indexPath
        )
        return cell
    }

}
