//
//  SecondListCell.swift
//  Project-ClonePassOrder
//
//  Created by 정덕호 on 2022/05/19.
//

import UIKit

class SecondListCell: UICollectionViewCell {
    
    //MARK: - 식별자
    
    static let identifier = "SecondListCell"
    
    //MARK: - 프로퍼티
    
   private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .lightGray
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 10
        return iv
    }()
   private let nameLabel: UILabel = UILabel().listLabel(
        text: "메가커피 양주점",
        color: .black,
        font: .boldSystemFont(ofSize: 18)
   )
   private let timeLabel: UILabel = UILabel().listLabel(
        text: "10분후 수령가능",
        color: .systemOrange,
        font: .boldSystemFont(ofSize: 16)
   )
    private let timeImage: UIImageView = UIImageView().listImageView(
        imageName: "timer",
        color: .systemOrange
    )
    private let distanceLabel: UILabel = UILabel().listLabel(
        text: "4.6km",
        color: .lightGray,
        font: .boldSystemFont(ofSize: 16)
    )
    private let distanceImage: UIImageView = UIImageView().listImageView(
        imageName: "location.north.fill",
        color: .lightGray
    )
    private let likeImage: UIImageView = UIImageView().listImageView(
        imageName: "heart.fill",
        color: .systemRed
    )
    private let likeLabel: UILabel = UILabel().listLabel(
        text: "0",
        color: .systemRed,
        font: .systemFont(ofSize: 16)
    )
    private let storyImage: UIImageView = UIImageView().listImageView(
        imageName: "bubble.right.fill",
        color: .black
    )
    private let storyLabel: UILabel = UILabel().listLabel(
        text: "0",
        color: .black,
        font: .systemFont(ofSize: 16)
    )
    
    //MARK: - 라이프사이클
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - 메서드
    
    private func setLayout() {
        [imageView,
         nameLabel,
         timeLabel,
         timeImage,
         distanceLabel,
         distanceImage,
         likeImage,
         likeLabel,
         storyImage,
         storyLabel].forEach {
            self.addSubview($0)
        }
        imageView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.height.width.equalTo(85)
            make.centerY.equalToSuperview()
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.top).offset(5)
            make.leading.equalTo(imageView.snp.trailing).offset(10)
        }
        likeImage.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
            make.leading.equalTo(imageView.snp.trailing).offset(10)
            make.height.width.equalTo(18)
        }
        likeLabel.snp.makeConstraints { make in
            make.leading.equalTo(likeImage.snp.trailing).offset(3)
            make.centerY.equalTo(likeImage)
        }
        storyImage.snp.makeConstraints { make in
            make.leading.equalTo(likeLabel.snp.trailing).offset(8)
            make.centerY.equalTo(likeImage)
            make.height.width.equalTo(18)
        }
        storyLabel.snp.makeConstraints { make in
            make.leading.equalTo(storyImage.snp.trailing).offset(3)
            make.centerY.equalTo(likeImage)
        }
        timeImage.snp.makeConstraints { make in
            make.top.equalTo(likeImage.snp.bottom).offset(5)
            make.leading.equalTo(imageView.snp.trailing).offset(10)
            make.height.width.equalTo(18)
        }
        timeLabel.snp.makeConstraints { make in
            make.leading.equalTo(timeImage.snp.trailing).offset(3)
            make.centerY.equalTo(timeImage)
        }
        distanceImage.snp.makeConstraints { make in
            make.leading.equalTo(timeLabel.snp.trailing).offset(8)
            make.centerY.equalTo(timeImage)
            make.height.width.equalTo(16)
        }
        distanceLabel.snp.makeConstraints { make in
            make.leading.equalTo(distanceImage.snp.trailing).offset(3)
            make.centerY.equalTo(distanceImage)
        }
    }
}
