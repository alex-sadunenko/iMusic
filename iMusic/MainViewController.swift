//
//  MainViewController.swift
//  iMusic
//
//  Created by Alex on 03.09.2020.
//  Copyright © 2020 Alex Sadunenko. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .gray
        
        tabBar.tintColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        
        let searchViewController = SearchTableViewController()
        let viewController = ViewController()

        let navigationViewController = generateViewController(rootViewcontroller: searchViewController, image: #imageLiteral(resourceName: "search"), title: "Search")
        let libraryViewController = generateViewController(rootViewcontroller: viewController, image: #imageLiteral(resourceName: "music-note"), title: "Library")
        
        viewControllers = [
            navigationViewController,
            libraryViewController
        ]
    }
    
    func generateViewController(rootViewcontroller: UIViewController, image: UIImage, title: String) -> UIViewController {
        
        rootViewcontroller.navigationItem.title = title
        
        let newViewController = UINavigationController(rootViewController: rootViewcontroller)
        newViewController.tabBarItem.image = image
        newViewController.tabBarItem.title = title
        newViewController.navigationBar.prefersLargeTitles = true
        
        return newViewController
    }

}
