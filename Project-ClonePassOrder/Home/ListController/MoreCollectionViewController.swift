//
//  MoreCollectionViewController.swift
//  Project-ClonePassOrder
//
//  Created by 정덕호 on 2022/05/19.
//

import UIKit

class MoreCollectionViewController: UICollectionViewController {

    //MARK: - 라이프사이클

    override func viewDidLoad() {
        super.viewDidLoad()
        setAtrribute()
    }
    init() {
        let layout = UICollectionViewCompositionalLayout { section, env in
             let item = NSCollectionLayoutItem(
                layoutSize: .init(widthDimension: .fractionalWidth(1),
                                  heightDimension: .fractionalHeight(1))
             )
             item.contentInsets = NSDirectionalEdgeInsets(
                top:0, leading: 0, bottom: 20, trailing: 20
             )
             let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: .init(widthDimension: .fractionalWidth(1),
                                  heightDimension: .fractionalHeight(1/3)),
                subitem: item, count: 2
             )
             group.contentInsets.leading = 20
             let section = NSCollectionLayoutSection(group: group)
            return section
        }
        super.init(collectionViewLayout: layout)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - 메서드
    
    private func setAtrribute() {
        self.collectionView!.register(SortCell.self, forCellWithReuseIdentifier: SortCell.identifier)
    }

    //MARK: - 컬렉션뷰 데이터소스
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: SortCell.identifier,
            for: indexPath
        ) as! SortCell
        cell.backgroundColor = .blue
        return cell
    }
}
