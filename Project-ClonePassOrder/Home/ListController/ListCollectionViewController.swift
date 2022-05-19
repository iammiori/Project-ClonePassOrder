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
                                      heightDimension: .absolute(110)),
                    subitems: [item])
                 let section = NSCollectionLayoutSection(group: group)
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
                                      heightDimension: .absolute(90)),
                    subitems: [item])
                 let section = NSCollectionLayoutSection(group: group)
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
                 section.contentInsets.bottom = 50
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
                          alignment: .bottomTrailing)
                 ]
                 section.contentInsets.leading = 50
                 section.contentInsets.top = 20
                 section.contentInsets.bottom = 50
                 return section
             case 4:
                 let item = NSCollectionLayoutItem(
                    layoutSize: .init(
                        widthDimension: .absolute(220), heightDimension: .absolute(280))
                 )
                 item.contentInsets.trailing = 20
                 let group = NSCollectionLayoutGroup.horizontal(
                    layoutSize: .init(widthDimension: .absolute(220),
                                      heightDimension: .absolute(280)),
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
                 section.contentInsets.bottom = 50
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
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.register(
            FirstADCell.self,
            forCellWithReuseIdentifier: FirstADCell.identifier
        )
        collectionView.register(
            SecondADCell.self,
            forCellWithReuseIdentifier: SecondADCell.identifier
        )
        collectionView.register(
            FirstListCell.self,
            forCellWithReuseIdentifier: FirstListCell.identifier
        )
        collectionView.register(
            SecondListCell.self,
            forCellWithReuseIdentifier: SecondListCell.identifier
        )
        collectionView.register(
            ThirdListCell.self,
            forCellWithReuseIdentifier: ThirdListCell.identifier
        )
        collectionView.register(
            ListCellHeader.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: ListCellHeader.identifier)
        
        collectionView.register(
            ListCellFooter.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
            withReuseIdentifier: ListCellFooter.identifier)
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
    override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: FirstADCell.identifier,
                for: indexPath
            ) as! FirstADCell
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: SecondADCell.identifier,
                for: indexPath
            ) as! SecondADCell
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: FirstListCell.identifier,
                for: indexPath
            ) as! FirstListCell
            return cell
        case 3:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: SecondListCell.identifier,
                for: indexPath
            ) as! SecondListCell
            return cell
        case 4:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ThirdListCell.identifier,
                for: indexPath
            ) as! ThirdListCell
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "cell",
                for: indexPath
            )
            cell.backgroundColor = .red
            return cell
        }
    }
    override func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: ListCellHeader.identifier,
                for: indexPath
            ) as! ListCellHeader
            switch indexPath.section {
            case 2:
                header.firstLabel.text = "정덕호님과"
                header.secondLabel.text = "가까이 있는 매장이에요!"
                let attributedString = NSMutableAttributedString(string: header.secondLabel.text!)
                attributedString.addAttribute(
                    .foregroundColor,
                    value: UIColor.systemOrange,
                    range: (header.secondLabel.text! as NSString).range(of:"가까이 있는 매장"))
                header.secondLabel.attributedText = attributedString
                return header
            case 3:
                header.firstLabel.text = "정덕호님 근처에있는"
                header.secondLabel.text = "스토리가 많은 매장이에요!"
                let attributedString = NSMutableAttributedString(string: header.secondLabel.text!)
                //시스템 민트색이 15.0 버전부터 된다고 하네요
                if #available(iOS 15.0, *) {
                    attributedString.addAttribute(
                        .foregroundColor,
                        value: UIColor.systemMint,
                        range: (header.secondLabel.text! as NSString).range(of:"스토리가 많은 매장이에요!"))
                } else {
                    attributedString.addAttribute(
                        .foregroundColor,
                        value: UIColor.systemBrown,
                        range: (header.secondLabel.text! as NSString).range(of:"스토리가 많은 매장이에요!"))
                }
                header.secondLabel.attributedText = attributedString
                return header
            case 4:
                header.firstLabel.text = "새로추가된"
                header.secondLabel.text = "신규매장을 소개합니다!"
                let attributedString = NSMutableAttributedString(string: header.secondLabel.text!)
                attributedString.addAttribute(
                    .foregroundColor,
                    value: UIColor.systemGreen,
                    range: (header.secondLabel.text! as NSString).range(of:"신규매장을 소개합니다!"))
                header.secondLabel.attributedText = attributedString
                return header
            default:
                return header
            }
        case UICollectionView.elementKindSectionFooter:
            let footer = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: ListCellFooter.identifier,
                for: indexPath
            ) as! ListCellFooter
            switch indexPath.section {
            case 2:
                footer.currentSection = .FirstCell
                return footer
            case 3:
                footer.currentSection = .SecondCell
                return footer
            case 4:
                footer.currentSection = .ThirdCell
                return footer
            default:
                return UICollectionReusableView()
            }
        default:
            return UICollectionReusableView()
        }
    }

//MARK: - 컬렉션뷰 델리게이트

    
}


extension ListCollectionViewController: ListCellDelegate {
    func firstFooterTapped() {
        let vc = MoreCollectionViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func secondFooterTapped() {
        let vc = MoreCollectionViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func thirdFooterTapped() {
        let vc = MoreCollectionViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
