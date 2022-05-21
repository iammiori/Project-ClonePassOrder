//
//  OrderMenuViewController.swift
//  Project-ClonePassOrder
//
//  Created by miori Lee on 2022/05/17.
//

import Foundation
import SnapKit

class OrderMenuViewController : UIViewController {
    let searchBar = OrderMenuSearchBar()
    let categoryCV = MenuCollectionView()
    let categoryCVVM = MenuCollectionViewModel()
    let menuTV = DetailMenuTableView()
    let menuTVVM = DetailMenuTableViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setAttribute()
        setLayout()
        setLeftBarButtonItem()
        setCollectionView()
        setTabelView()
    }
}
extension OrderMenuViewController {
    private func setAttribute(){
        view.backgroundColor = .white
        self.title = "빽다방 미사스마트밸리점"
    }
    private func setLayout(){
        [searchBar,categoryCV,menuTV].forEach {self.view.addSubview($0)}
        searchBar.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
        categoryCV.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(0.05)
        }
        menuTV.snp.makeConstraints {
            $0.top.equalTo(categoryCV.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    private func setLeftBarButtonItem(){
        let leftBarButton: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(backButtonTapped))
        leftBarButton.tintColor = .black
        navigationItem.leftBarButtonItem = leftBarButton
    }
    private func setCollectionView() {
        categoryCV.delegate = self
        categoryCV.dataSource = self
    }
    private func setTabelView(){
        menuTV.delegate = self
        menuTV.dataSource = self
    }
}
extension OrderMenuViewController {
    @objc func backButtonTapped(){
        self.dismiss(animated: true)
    }
}
extension OrderMenuViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryCVVM.numberOfCategoryArr
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCollectionViewCell.registerID, for: indexPath) as? MenuCollectionViewCell else {
            return UICollectionViewCell()
        }
        let categoryName = categoryCVVM.getCategoryName(index: indexPath.row)
        cell.setData(categoryName)
        if indexPath.row == categoryCVVM.defaultItemIdx {
            collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .init())
        }
        return cell
    }
}
extension OrderMenuViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let categoryName = categoryCVVM.getCategoryName(index: indexPath.row).categoryName
        let cellWidth = categoryName.size(withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15)]).width + 10
        let cellHeight = collectionView.frame.height * 0.6
        let cellSize = CGSize(width: cellWidth, height: cellHeight)
        
        return cellSize
    }
}
extension OrderMenuViewController : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return menuTVVM.numberOfCategoryArrForHeader
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return menuTVVM.getCategoryName(index: section).categoryName
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailMenuTableViewCell.registerID, for: indexPath) as? DetailMenuTableViewCell else {
            return UITableViewCell()
        }
//        let shoppingItem  = shoppingTVVM.storage.value[indexPath.row]
//
//        cell.setData(shoppingItem)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }

}
extension OrderMenuViewController : UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == self.menuTV {
            let topSectionIndex = self.menuTV.indexPathsForVisibleRows?.map({ $0.section }).sorted().first
            let selectedCollectionIndex = self.categoryCV.indexPathsForSelectedItems?.first?.row
            if selectedCollectionIndex != topSectionIndex {
                let indexPath = IndexPath(item: topSectionIndex!, section: 0)
                self.categoryCV.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
            }
        }
    }
}
