//
//  OrderHistoryTableViewCell.swift
//  Project-ClonePassOrder
//
//  Created by Eunsoo KIM on 2022/05/24.
//

import UIKit
import SnapKit

class OrderHistoryTableViewCell: UITableViewCell {
    
    // MARK: - UI Properties
    
    let orderHystoryCellView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let storeNameLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .title1)
        label.text = "빽다방 부천점"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let paymentMethodLabel: UILabel = {
        let label = UILabel()
        label.text = "카카오페이 결제"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let paymentDateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray3
        label.text = "| " + "16일 15:59"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let orderTypeLabel: UILabel = {
        let label = UILabel()
        label.text = "가져갈게요"
        label.textColor = .systemGray3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let orderNumberLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 40)
        label.text = "1"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let orderStateLabel: UILabel = {
        let label = UILabel()
        label.text = "수령완료"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let seperatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        view.backgroundColor = .gray
        return view
    }()
    let menuLabel: UILabel = {
        let label = UILabel()
        label.text = "메뉴"
        label.textColor = .orange
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let menuValueLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 15)
        label.text = "앗!메리카노(Iced)"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let moreButton: UIButton = {
        let button = UIButton()
        button.setTitle("더보기 >", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13)
        button.setTitleColor(UIColor.orange, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "결제 금액"
        label.textColor = .orange
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let priceValueLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 15)
        label.text = "2000원"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let reorderButton: UIButton = {
        let button = UIButton()
        button.setTitle("재 주문 할게요!", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .orange
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let storyButton: UIButton = {
        let button = UIButton()
        button.setTitle("스토리 작성", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .gray
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    lazy var paymentInfoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [paymentMethodLabel, paymentDateLabel])
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    lazy var paymentInfoOrdeTypeStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [paymentInfoStackView, orderTypeLabel])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .leading
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    lazy var storeNamePaymenInfoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [storeNameLabel, paymentInfoOrdeTypeStackView])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    lazy var orderNumberStateStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [orderNumberLabel, orderStateLabel])
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    lazy var orderInfoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [storeNamePaymenInfoStackView, orderNumberStateStackView])
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    lazy var menuStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [menuLabel, menuValueLabel, moreButton])
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .top
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    lazy var priceStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [priceLabel, priceValueLabel])
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    lazy var reorderStorystackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [reorderButton, storyButton])
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: - setLayout
    
    private func setLayout() {
        contentView.backgroundColor = .systemGray5
        
        contentView.addSubview(orderHystoryCellView)
        orderHystoryCellView.addSubview(orderInfoStackView)
        orderHystoryCellView.addSubview(seperatorView)
        orderHystoryCellView.addSubview(menuStackView)
        orderHystoryCellView.addSubview(priceStackView)
        orderHystoryCellView.addSubview(reorderStorystackView)
        
        orderHystoryCellView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview().inset(10)
        }
        orderNumberStateStackView.snp.makeConstraints { make in
            make.width.equalTo(80)
        }
        orderInfoStackView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(20)
        }
        seperatorView.snp.makeConstraints { make in
            make.top.equalTo(orderInfoStackView).offset(10)
            make.leading.trailing.equalToSuperview().inset(10)
        }
        menuLabel.snp.makeConstraints { make in
            make.width.equalTo(80)
        }
        moreButton.snp.makeConstraints { make in
            make.width.equalTo(60)
        }
        menuStackView.snp.makeConstraints { make in
            make.top.equalTo(seperatorView).offset(10)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        priceLabel.snp.makeConstraints { make in
            make.width.equalTo(80)
        }
        priceStackView.snp.makeConstraints { make in
            make.top.equalTo(seperatorView).offset(10)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        reorderStorystackView.snp.makeConstraints { make in
            make.top.equalTo(priceStackView).offset(10)
            make.leading.trailing.bottom.equalToSuperview().inset(10)
        }
    }
}
