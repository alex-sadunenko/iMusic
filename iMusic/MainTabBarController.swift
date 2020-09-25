//
//  MainTabBarController.swift
//  iMusic
//
//  Created by Alex on 24.09.2020.
//  Copyright © 2020 Alex Sadunenko. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        tabBar.tintColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        
        let searchVC = SearchMusicViewController()
        let libraryVC = LibraryViewController()
        
        viewControllers = [
            generateViewController(rootViewController: searchVC, image: #imageLiteral(resourceName: "search"), title: "Search"),
            generateViewController(rootViewController: libraryVC, image: #imageLiteral(resourceName: "music-note"), title: "Library")]
    }
    
    private func generateViewController(rootViewController: UIViewController, image: UIImage, title: String) -> UIViewController {
        
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.image = image
        navigationVC.tabBarItem.title = title
        rootViewController.navigationItem.title = title
        navigationVC.navigationBar.prefersLargeTitles = true
        
        return navigationVC
    }
}
