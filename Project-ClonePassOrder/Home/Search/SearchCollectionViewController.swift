//
//  SearchCollectionViewController.swift
//  Project-ClonePassOrder
//
//  Created by 정덕호 on 2022/05/20.
//

import UIKit

class SearchCollectionViewController: UICollectionViewController {

    //MARK: - 프로퍼티
    private var 임시카운트 = 0
    private let searchController = UISearchController(searchResultsController: nil)
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "검색결과없음이미지")
        iv.backgroundColor = .lightGray
        return iv
    }()
    
    //MARK: - 라이프사이클
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAtrribute()
        naviSetAttribute()
        setLayout()
    }
    init() {
        let layout = UICollectionViewCompositionalLayout { section, env in
             let item = NSCollectionLayoutItem(
                layoutSize: .init(widthDimension: .fractionalWidth(1),
                                  heightDimension: .fractionalHeight(1))
             )
             item.contentInsets = NSDirectionalEdgeInsets(
                top:0, leading: 0, bottom: 20, trailing: 10
             )
             let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: .init(widthDimension: .fractionalWidth(1),
                                  heightDimension: .fractionalHeight(1/2.7)),
                subitem: item, count: 2
             )
             group.contentInsets.leading = 10
             let section = NSCollectionLayoutSection(group: group)
            return section
        }
        super.init(collectionViewLayout: layout)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - 메서드
    private func setLayout() {
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(view.snp.topMargin)
        }
    }
    private func setAtrribute() {
        collectionView.register(SortCell.self, forCellWithReuseIdentifier: SortCell.identifier)
        
    }
    private func naviSetAttribute() {
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.topItem?.title = ""
        tabBarController?.tabBar.isHidden = true
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = "키워드로 검색하기"
        searchController.searchBar.setValue("취소", forKey: "cancelButtonText")
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }

    //MARK: - 컬렉션뷰 데이터소스

    override func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        if 임시카운트 == 0 {
            imageView.isHidden = false
            return 임시카운트
        } else {
            imageView.isHidden = true
            return 임시카운트
        }
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


//MARK: - SearchResultsUpdating

extension SearchCollectionViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        임시카운트 += 1
        collectionView.reloadData()
    }
}
