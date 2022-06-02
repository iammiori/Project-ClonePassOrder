//
//  TabBarController.swift
//  Project-ClonePassOrder
//
//  Created by 정덕호 on 2022/05/17.
//

import UIKit
import Firebase
import SwiftUI

class TabBarController: UITabBarController {
    
    //MARK: - 프로퍼티
    private var firstADListViewModel: ADListViewModel = ADListViewModel()
    private var secondADListViewModel: ADListViewModel = ADListViewModel()
    private let indicatorView: UIImageView = UIImageView().indicatorView()
    var serviceCount: Int = 0 {
        didSet {
            if serviceCount == 3 {
                setNavigation(firstAD: self.firstADListViewModel, secondAD: secondADListViewModel)
                setAttribute()
                indicatorView.removeFromSuperview()
            }
        }
    }
    
    //MARK: - lifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setImageView()
        setBinding()
        auth()
    }
    
    //MARK: - HelperFunction
    
    private func setImageView() {
        UIImageView.indicatorSetLayout(view: self.view, imageView: indicatorView)
    }
    private func setNavigation(firstAD: ADListViewModel,secondAD: ADListViewModel) {
        let homeVC = HomeViewController()
        homeVC.firstADListViewModel = firstAD
        homeVC.secondADListViewModel = secondAD
        let orderHistoryVC = OrderHistoryViewController()
        let favoriteVC = FavoriteViewController()
        let qrCameraVC = qrCameraViewController()
        let myPasserVC = MyPasserTableViewController(style: .grouped)
        myPasserVC.viewDidLoad()
        let homeNavi = templatNavigation(
            title: "홈",
            image: UIImage(systemName: "cup.and.saucer.fill")!,
            rootViewController: homeVC
        )
        let orderHistoryNavi = templatNavigation(
            title: "주문내역",
            image: UIImage(systemName: "list.bullet.rectangle.portrait.fill")!,
            rootViewController: orderHistoryVC
        )
        let favoriteNavi = templatNavigation(
            title: "자주가요",
            image: UIImage(systemName: "star.fill")!,
            rootViewController: favoriteVC
        )
        let qrCameraNavi = templatNavigation(
            title: "큐알주문",
            image: UIImage(systemName: "qrcode")!,
            rootViewController: qrCameraVC
        )
        let myPasserNavi = templatNavigation(
            title: "마이패써",
            image: UIImage(systemName: "smiley.fill")!,
            rootViewController: myPasserVC
        )
        viewControllers = [homeNavi,orderHistoryNavi,favoriteNavi,qrCameraNavi,myPasserNavi]
    }
    private func setAttribute() {
        tabBar.tintColor = .black
        tabBar.backgroundColor = .white
        tabBar.addShadow()
    }
    private func templatNavigation(
        title: String,
        image: UIImage,
        rootViewController: UIViewController
    ) -> UINavigationController {
        let navi = UINavigationController(rootViewController: rootViewController)
        navi.tabBarItem.image = image
        navi.tabBarItem.title = title
        return navi
    }
    func setBinding() {
        UserViewModel.shared.model.bind { [weak self] _ in
            self?.serviceCount += 1
        }
        UserViewModel.shared.userServiceError.bind { error in
            UserViewModel.shared.userFetch(uid: Auth.auth().currentUser!.uid)
        }
        firstADListViewModel.ADServiceError.bind { [weak self] error  in
            self?.firstADListViewModel.fetchAD(collectionName: "SecondAD")
        }
        firstADListViewModel.items.bind { [weak self] _ in
            self?.serviceCount += 1
        }
        secondADListViewModel.ADServiceError.bind { [weak self] error in
            self?.secondADListViewModel.fetchAD(collectionName: "FirstAD")
        }
        secondADListViewModel.items.bind { [weak self] _ in
            self?.serviceCount += 1
        }
    }
    func auth() {
        if Auth.auth().currentUser == nil {
            DispatchQueue.main.async {
                let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
                guard let delegate = sceneDelegate else {
                    return
                }
                let vc = UINavigationController(rootViewController: LoginViewController())
                delegate.window?.rootViewController = vc
            }
        } else {
            UserViewModel.shared.userFetch(uid: Auth.auth().currentUser!.uid)
            firstADListViewModel.fetchAD(collectionName: "SecondAD")
            secondADListViewModel.fetchAD(collectionName: "FirstAD")
        }
    }
    

}
