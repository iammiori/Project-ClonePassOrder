//
//  FavoriteViewController.swift
//  Project-ClonePassOrder
//
//  Created by 정덕호 on 2022/05/13.
//

import UIKit

class FavoriteViewController: UICollectionViewController {

    //MARK: - 라이프사이클
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAtrribute()
        naviSetAttribute()
    }
    init() {
        let layout = UICollectionViewCompositionalLayout.sortLayout()
        super.init(collectionViewLayout: layout)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - 메서드
    
    private func setAtrribute() {
        collectionView.register(
            SortCell.self,
            forCellWithReuseIdentifier: SortCell.identifier
        )
    }
    private func naviSetAttribute() {
    }
    
    //MARK: - 컬렉션뷰 데이터소스
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    override func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return 10
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
