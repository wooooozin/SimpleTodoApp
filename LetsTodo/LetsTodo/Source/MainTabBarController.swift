//
//  MainTabBarController.swift
//  LetsTodo
//
//  Created by 효우 on 2022/11/03.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
        setupStyle()
    }

}

// MARK: - Methods
extension MainTabBarController {
    
    func setupViewControllers() {
        view.backgroundColor = .white
        
        let listVC = templateNavigationController(
            unselectedImage: UIImage(systemName: "folder"),
            selectedImage: UIImage(systemName: "folder.fill"),
            rootViewController: ListViewController()
        )
        
        let WriteVC = templateNavigationController(
            unselectedImage: UIImage(systemName: "house"),
            selectedImage: UIImage(systemName: "house.fill"),
            rootViewController: WriteViewController()
        )
        
        let settingVC = templateNavigationController(
            unselectedImage: UIImage(systemName: "gearshape"),
            selectedImage: UIImage(systemName: "gearshape.fill"),
            rootViewController: SettingViewController()
        )
        
        self.setViewControllers([listVC, WriteVC, settingVC], animated: true)
        self.selectedIndex = 1
        self.tabBar.tintColor = .black
        
    }
    
    func templateNavigationController(
        unselectedImage: UIImage?,
        selectedImage: UIImage?,
        rootViewController: UIViewController
    ) -> UINavigationController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.image = unselectedImage
        navigationVC.tabBarItem.selectedImage = selectedImage
        navigationVC.navigationBar.tintColor = .black
        return navigationVC
    }
    
    func setupStyle() {
        UITabBar.clearShadow()
        tabBar.layer.applyShadow(color: .gray, alpha: 0.3, x: 0, y: 0, blur: 12)
    }
}
