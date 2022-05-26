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
// MARK: - extension UITextField

extension UITextField {
    func addLeftPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
}
