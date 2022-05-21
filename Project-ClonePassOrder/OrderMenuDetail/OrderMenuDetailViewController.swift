//
//  OrderMenuDetailViewController.swift
//  Project-ClonePassOrder
//
//  Created by miori Lee on 2022/05/19.
//

import Foundation
import SnapKit

class OrderMenuDetailViewController : UIViewController {
    let detailTV = OrderMenuDetailTableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setAttribute()
        setLayout()
        setTableView()
    }
}
extension OrderMenuDetailViewController {
    private func setAttribute(){
        view.backgroundColor = .white
        self.title = "빽다방 미사스마트밸리점"
    }
    private func setLayout(){
        [detailTV].forEach {self.view.addSubview($0)}
        detailTV.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide)
        }
    }
    private func setTableView(){
        detailTV.delegate = self
        detailTV.dataSource = self
    }
}
extension OrderMenuDetailViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: OrderMenuDetailInfoCell.registerID, for: indexPath) as? OrderMenuDetailInfoCell else { return UITableViewCell() }
        return cell
    }
    
    
}
