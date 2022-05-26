//
//  StoryCommentViewController.swift
//  Project-ClonePassOrder
//
//  Created by Eunsoo KIM on 2022/05/26.
//

import UIKit
import SnapKit

class StoryCommentViewController: UIViewController {

// MARK: - extension UITextField

extension UITextField {
    func addLeftPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
}
