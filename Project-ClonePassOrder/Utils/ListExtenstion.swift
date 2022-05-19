//
//  ListExtenstion.swift
//  Project-ClonePassOrder
//
//  Created by 정덕호 on 2022/05/19.
//

import UIKit

extension UILabel {
    func listLabel(text: String, color: UIColor, font: UIFont) -> UILabel {
        let lb = UILabel()
        lb.text = text
        lb.font = font
        lb.textColor = color
        return lb
    }
}

extension UIImageView {
    func listImageView(imageName: String, color: UIColor) -> UIImageView {
        let iv = UIImageView()
        iv.image = UIImage(systemName: imageName)
        iv.tintColor = color
        return iv
    }
}
