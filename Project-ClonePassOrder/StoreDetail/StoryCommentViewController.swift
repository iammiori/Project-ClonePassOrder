//
//  StoryCommentViewController.swift
//  Project-ClonePassOrder
//
//  Created by Eunsoo KIM on 2022/05/26.
//

import UIKit
import SnapKit

class StoryCommentViewController: UIViewController {

    // MARK: - UI Properties

    let commentTableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    let floatingView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    let commentTextField: UITextField = {
        let textField = UITextField()
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = 20
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.systemGray.cgColor
        textField.placeholder = "댓글을 입력해 주세요"
        textField.addLeftPadding()
        return textField
    }()
    let commentWriteCompletButton: UIButton = {
        let button = UIButton()
        button.setTitle("확인", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.isEnabled = false
        return button
    }()

    // MARK: - setLayout

    private func setLayout() {
        view.backgroundColor = .white
        
        view.addSubview(commentTableView)
        view.addSubview(floatingView)
        floatingView.addSubview(commentTextField)
        floatingView.addSubview(commentWriteCompletButton)
        
        commentTableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(floatingView.snp.top)
        }
        floatingView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview().inset(10)
            make.height.equalTo(80)
        }
        commentTextField.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(30)
        }
        commentWriteCompletButton.snp.makeConstraints { make in
            make.centerY.equalTo(commentTextField)
            make.width.equalTo(40)
            make.trailing.equalTo(commentTextField).inset(10)
        }
    }

    // MARK: - setTableView

    private func setTableView() {
        commentTableView.separatorStyle = .none
        commentTableView.delegate = self
        commentTableView.dataSource = self
        commentTableView.register(CommentTableViewCell.self, forCellReuseIdentifier: "cell")
    }

    // MARK: - setTextField

    private func setTextField() {
        commentTextField.delegate = self
    }

    // MARK: - setNavigation

    private func setNavigation() {
        title = "댓글"
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "xmark")
            , style: .plain,
            target: self,
            action: #selector(backButtonTapped)
        )
        navigationController?.navigationBar.tintColor = .black
    }
    @objc private func backButtonTapped() {
        dismiss(animated: true)
    }
    @objc private func moreButtonTapped() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "신고", style: .default))
        alert.addAction(UIAlertAction(title: "삭제", style: .destructive))
        alert.addAction(UIAlertAction(title: "취소", style: .cancel))
        
        present(alert, animated: true)
    }
// MARK: - extension UITextField

extension UITextField {
    func addLeftPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
}
