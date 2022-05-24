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

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
