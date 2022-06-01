//
//  TabBarController.swift
//  Project-ClonePassOrder
//
//  Created by 정덕호 on 2022/05/17.
//

import UIKit
import Firebase

class TabBarController: UITabBarController {
    
    //MARK: - 프로퍼티
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "로딩이미지")
        return iv
    }()
    
    //MARK: - lifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBinding()
        setImageView()
        auth()
    }
    
    //MARK: - HelperFunction
    
    private func setImageView() {
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    private func setNavigation() {
        let homeCV = HomeViewController()
        let orderHistoryCV = OrderHistoryViewController()
        let favoriteCV = FavoriteViewController()
        let qrCameraCV = qrCameraViewController()
        let myPasserCV = MyPasserTableViewController(style: .grouped)
        myPasserCV.viewDidLoad()
        let homeNavi = templatNavigation(
            title: "홈",
            image: UIImage(systemName: "cup.and.saucer.fill")!,
            rootViewController: homeCV
        )
        let orderHistoryNavi = templatNavigation(
            title: "주문내역",
            image: UIImage(systemName: "list.bullet.rectangle.portrait.fill")!,
            rootViewController: orderHistoryCV
        )
        let favoriteNavi = templatNavigation(
            title: "자주가요",
            image: UIImage(systemName: "star.fill")!,
            rootViewController: favoriteCV
        )
        let qrCameraNavi = templatNavigation(
            title: "큐알주문",
            image: UIImage(systemName: "qrcode")!,
            rootViewController: qrCameraCV
        )
        let myPasserNavi = templatNavigation(
            title: "마이패써",
            image: UIImage(systemName: "smiley.fill")!,
            rootViewController: myPasserCV
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
            self!.setNavigation()
            self!.setAttribute()
        }
        UserViewModel.shared.userImageFetchEnd.bind { [weak self] _ in
            self!.imageView.removeFromSuperview()
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
        }
    }
    

}
