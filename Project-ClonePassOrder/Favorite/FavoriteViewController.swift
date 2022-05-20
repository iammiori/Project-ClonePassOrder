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
    
    //MARK: - 메서드
    
    private func setAtrribute() {
    }
    private func naviSetAttribute() {
    }
    
    //MARK: - 컬렉션뷰 데이터소스
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
    }
    override func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
    }
    override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        
    }
}
