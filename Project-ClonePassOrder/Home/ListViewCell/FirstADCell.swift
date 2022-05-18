//
//  FistADCell.swift
//  Project-ClonePassOrder
//
//  Created by 정덕호 on 2022/05/18.
//

import SnapKit
import UIKit

class FirstADCell: UICollectionViewCell {
    
    //MARK: - 식별자
    
    static let identifier: String = "FirstADCell"
    
    //MARK: - 프로퍼티
    
    private var currentPage: CGFloat = 0
    private let scrollView: UIScrollView = UIScrollView()
    private var image = [UIImage(systemName: "heart")!,UIImage(systemName: "star.fill")!,UIImage(named: "패스오더로그인이미지")!,UIImage(systemName: "star.fill")!,UIImage(named: "패스오더로그인이미지")!]
    
    //MARK: - 라이프사이클
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setAtrribute()
        setLayout()
        addContentScrollView()
        ADTimer()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - 메서드
    
    private func setLayout() {
        self.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
    }
    private func setAtrribute() {
        scrollView.isPagingEnabled = true
        scrollView.isScrollEnabled = false
    }
    private func addContentScrollView() {
        for i in 0..<image.count {
            let imageView: UIImageView = UIImageView(frame: self.frame)
            let xPos = self.frame.width * CGFloat(i)
            imageView.frame = CGRect(
                x: xPos,
                y: 0,
                width: self.bounds.width,
                height: self.bounds.height
            )
            imageView.image = image[i]
            scrollView.addSubview(imageView)
            scrollView.contentSize.width = imageView.frame.width * CGFloat(i + 1)
        }
    }
    private func ADTimer() {
        let _ = Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { [weak self] timer in
            guard let width = self?.bounds.width else {
                return
            }
            guard let count = self?.image.count else {
                return
            }
            if self?.currentPage == width * CGFloat(count - 1) {
                self?.currentPage = 0
                self?.scrollView.contentOffset.x = 0
            } else {
                self?.currentPage += width
                self?.scrollView.contentOffset.x += width
            }
        }
    }
}
