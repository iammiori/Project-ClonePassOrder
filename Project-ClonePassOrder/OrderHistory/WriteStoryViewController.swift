//
//  WriteStoryViewController.swift
//  Project-ClonePassOrder
//
//  Created by Eunsoo KIM on 2022/05/25.
//

import UIKit
import SnapKit

class WriteStoryViewController: UIViewController {
    
    // MARK: - UI Properties
    
    let storeNameLabel: UILabel = {
        let label = UILabel()
        label.text = "오늘도, 카페일리터 동두천점"
        label.numberOfLines = 2
        label.font = .boldSystemFont(ofSize: 25)
        return label
    }()
    let informationLabel: UILabel = {
        let label = UILabel()
        label.text = "스토리를 작성해 주세요"
        label.font = .boldSystemFont(ofSize: 25)
        return label
    }()
    let storeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .gray
        return imageView
    }()
    let registePictureTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "사진 등록이 필요해요"
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    let registePictureButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(#imageLiteral(resourceName: "addPicture"), for: .normal)
        return button
    }()
    let storytitleLabel: UILabel = {
        let label = UILabel()
        let text = "Q 음료의 양은 어땠나요?"
        label.text = "Q 음료의 양은 어땠나요?"
        label.font = .systemFont(ofSize: 20)
        
        let attributeString = NSMutableAttributedString(string: text)
        attributeString.addAttribute(.foregroundColor, value: UIColor.orange, range: (text as NSString).range(of: "Q"))
        label.attributedText = attributeString
        return label
    }()
    let storyTextView: UITextView = {
        let textView = UITextView()
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.systemGray3.cgColor
        return textView
    }()
    private let floatingView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    private let floatingButton: UIButton = {
        let button = UIButton()
        button.setTitle("작성하기", for: .normal)
        button.titleLabel?.lineBreakMode = .byWordWrapping
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = #colorLiteral(red: 1, green: 0.4730066061, blue: 0.2864735723, alpha: 1)
        button.layer.cornerRadius = 10
        return button
    }()
    lazy var informationLabelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [storeNameLabel, informationLabel])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fill
        
        return stackView
    }()
    lazy var writeStoryInpormationStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [informationLabelStackView, storeImageView])
        stackView.axis = .horizontal
        stackView.alignment = .top
        stackView.distribution = .fill
        stackView.spacing = 10
        return stackView
    }()
}
