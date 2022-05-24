//
//  OrderHistoryViewController.swift
//  Project-ClonePassOrder
//
//  Created by 정덕호 on 2022/05/13.
//

import UIKit
import SnapKit

class OrderHistoryViewController: UIViewController {
    
    // MARK: - UI Properties
    
    let orderHistorTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.separatorStyle = .none
        return tableView
    }()
    let orderDateSelectButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.title = "2022년 05월 >"
        button.tintColor = .black
        return button
    }()

    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        setDelegate()
        setLayout()
        orderHistorTableView.register(OrderHistoryTableViewCell.self, forCellReuseIdentifier: "cellID")
        orderHistorTableView.register(OrderHistoryTableViewHeaderView.self, forHeaderFooterViewReuseIdentifier: "header")
    }
    
    // MARK - setLayout
    
    private func setLayout() {
        view.addSubview(orderHistorTableView)
        orderHistorTableView.snp.makeConstraints({ make in
            make.leading.trailing.top.bottom.equalToSuperview()
        })
    }
    
    // MARK - setDelegate
    
    private func setDelegate() {
        orderHistorTableView.dataSource = self
        orderHistorTableView.delegate = self
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension OrderHistoryViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellID") as? OrderHistoryTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as? OrderHistoryTableViewHeaderView else {
            return UIView()
        }
        headerView.orderDateSelectButton.addTarget(self, action: #selector(orderDateSelectButtonTapped), for: .touchUpInside)
        return headerView
    }
}
