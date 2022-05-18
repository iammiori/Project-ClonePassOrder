//
//  ListCollectionViewController.swift
//  Project-ClonePassOrder
//
//  Created by 정덕호 on 2022/05/18.
//


import UIKit

class ListCollectionViewController: UICollectionViewController {
    
    //MARK: - 라이프사이클
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAtrribute()
    }
     init() {
         let layout = UICollectionViewCompositionalLayout { section, env in
             switch section {
             case 0:
                 let item = NSCollectionLayoutItem(
                    layoutSize: .init(widthDimension: .fractionalWidth(1),
                                      heightDimension: .fractionalHeight(1))
                 )
                 let group = NSCollectionLayoutGroup.horizontal(
                    layoutSize: .init(widthDimension: .fractionalWidth(1),
                                      heightDimension: .absolute(120)),
                    subitems: [item])
                 let section = NSCollectionLayoutSection(group: group)
                 section.boundarySupplementaryItems = [
                    .init(layoutSize: .init(widthDimension: .absolute(32),
                                      heightDimension: .absolute(22)),
                    elementKind: UICollectionView.elementKindSectionFooter,
                    containerAnchor: .init(edges: [.bottom,.trailing],
                                           fractionalOffset: .init(x: -0.5, y: -2.5)))
                 ]
                 section.orthogonalScrollingBehavior = .none
                 section.contentInsets.top = 20
                 section.contentInsets.bottom = 80
                 section.contentInsets.leading = 50
                 return section
             case 1:
                 let item = NSCollectionLayoutItem(
                    layoutSize: .init(widthDimension: .fractionalWidth(1),
                                      heightDimension: .fractionalHeight(1))
                 )
                 let group = NSCollectionLayoutGroup.horizontal(
                    layoutSize: .init(widthDimension: .fractionalWidth(1),
                                      heightDimension: .absolute(100)),
                    subitems: [item])
                 let section = NSCollectionLayoutSection(group: group)
                 section.boundarySupplementaryItems = [
                    .init(layoutSize: .init(widthDimension: .absolute(32),
                                      heightDimension: .absolute(22)),
                    elementKind: UICollectionView.elementKindSectionFooter,
                    containerAnchor: .init(edges: [.bottom,.trailing],
                                           fractionalOffset: .init(x: -0.5, y: -2.5)))
                 ]
                 section.orthogonalScrollingBehavior = .none
                 section.contentInsets.top = 20
                 section.contentInsets.bottom = 40
                 section.contentInsets.leading = 50
                 return section
             case 2:
                 let item = NSCollectionLayoutItem(
                    layoutSize: .init(widthDimension: .absolute(240),
                        heightDimension: .absolute(380))
                 )
                 item.contentInsets.trailing = 20
                 let group = NSCollectionLayoutGroup.horizontal(
                    layoutSize: .init(widthDimension: .absolute(240),
                                      heightDimension: .absolute(380)),
                    subitems: [item]
                 )
                 let section = NSCollectionLayoutSection(group: group)
                 section.orthogonalScrollingBehavior = .continuous
                 section.boundarySupplementaryItems = [
                    .init(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                            heightDimension: .absolute(80)),
                          elementKind: UICollectionView.elementKindSectionHeader,
                          alignment: .topLeading),
                    .init(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                            heightDimension: .absolute(60)),
                          elementKind: UICollectionView.elementKindSectionFooter,
                          alignment: .bottomTrailing)
                 ]
                 section.contentInsets.top = 20
                 section.contentInsets.bottom = 100
                 section.contentInsets.leading = 50
                 return section
                 
             case 3:
                 let item = NSCollectionLayoutItem(
                    layoutSize: .init(widthDimension: .absolute(350),
                        heightDimension: .fractionalHeight(1))
                 )
                 item.contentInsets = .init(top: 0, leading: 0, bottom: 10, trailing: 20)
                 let group = NSCollectionLayoutGroup.vertical(
                    layoutSize: .init(widthDimension: .absolute(350),
                                      heightDimension: .estimated(300)),
                    subitem: item, count: 3)
                 let section = NSCollectionLayoutSection(group: group)
                 section.orthogonalScrollingBehavior = .continuous
                 section.boundarySupplementaryItems = [
                    .init(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                            heightDimension: .absolute(80)),
                          elementKind: UICollectionView.elementKindSectionHeader,
                          alignment: .topLeading),
                    .init(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                            heightDimension: .absolute(60)),
                          elementKind: UICollectionView.elementKindSectionFooter,
                          alignment: .bottomTrailing)]
                 section.contentInsets.leading = 50
                 section.contentInsets.top = 20
                 section.contentInsets.bottom = 80
                 return section
                 
             case 4:
                 let item = NSCollectionLayoutItem(
                    layoutSize: .init(
                        widthDimension: .absolute(220), heightDimension: .absolute(290))
                 )
                 item.contentInsets.trailing = 20
                 let group = NSCollectionLayoutGroup.horizontal(
                    layoutSize: .init(widthDimension: .absolute(220),
                                      heightDimension: .absolute(290)),
                    subitems: [item]
                 )
                 let section = NSCollectionLayoutSection(group: group)
                 section.boundarySupplementaryItems = [
                    .init(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                            heightDimension: .absolute(80)),
                          elementKind: UICollectionView.elementKindSectionHeader,
                          alignment: .topLeading),
                    .init(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                            heightDimension: .absolute(60)),
                          elementKind: UICollectionView.elementKindSectionFooter,
                          alignment: .bottomTrailing)
                 ]
                 section.orthogonalScrollingBehavior = .continuous
                 section.contentInsets.leading = 50
                 section.contentInsets.top = 20
                 section.contentInsets.bottom = 100
                 return section
             default:
                 return NSCollectionLayoutSection(
                    group: NSCollectionLayoutGroup(
                        layoutSize: NSCollectionLayoutSize(
                            widthDimension: .absolute(0), heightDimension: .absolute(0)
                        )
                    )
                 )
             }
         }
        super.init(collectionViewLayout: layout)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - 메서드
    
    private func setAtrribute() {
        collectionView.register(FirstADCell.self, forCellWithReuseIdentifier: FirstADCell.identifier)
    }
    

    //MARK: - 컬렉션뷰 데이터소스
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0: return 1
        case 1: return 1
        default: return 10
        }
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FirstADCell.identifier, for: indexPath)
        return cell
    }
}
