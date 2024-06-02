//
//  TabBarViewController.swift
//  AppStoreQ
//
//  Created by Smart Castle M1A2004 on 02.12.2023.
import UIKit

class TabBarViewController: UITabBarController {
  /*  let flowLayout : UICollectionViewFlowLayout = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = .init(width: UIScreen.main.bounds.width - 30, height: 70)
        flowLayout.estimatedItemSize = .init(width: 30, height: 70) // razmer kotoryi pod func podstraivaisia etetin
        return flowLayout
    }() */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [
            createNavController(viewController: MainViewController(collectionViewLayout: UICollectionViewFlowLayout()), title: "Main", imageName: "today_icon"),
            createNavController(viewController: MusicViewController(collectionViewLayout: UICollectionViewFlowLayout()), title: "Music", imageName: "apps"),
            createNavController(viewController: SearchController(collectionViewLayout: UICollectionViewFlowLayout()), title: "Search", imageName: "search")
        ]
    }
    func createNavController(viewController: UIViewController, title: String, imageName: String) ->
    UIViewController {
        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationBar.prefersLargeTitles = true
        viewController.navigationItem.title = title
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: imageName)
        
        return navController
    }
}



