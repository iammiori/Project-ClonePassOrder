//
//  OrderHistoryTableViewHeaderView.swift
//  Project-ClonePassOrder
//
//  Created by Eunsoo KIM on 2022/05/24.
//

import UIKit
import SnapKit

class OrderHistoryTableViewHeaderView: UITableViewHeaderFooterView {
    
    // MARK: - UI Properties
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "주문내역"
        label.font = .boldSystemFont(ofSize: 50)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let orderDateSelectButton: UIButton = {
        let button = UIButton()
        button.setTitle("2022년 05월 >", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentHorizontalAlignment = .left
        return button
    }()
}
