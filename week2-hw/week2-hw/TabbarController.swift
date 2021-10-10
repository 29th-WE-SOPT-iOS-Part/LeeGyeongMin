//
//  TabbarController.swift
//  week2-hw
//
//  Created by 이경민 on 2021/10/11.
//

import UIKit

class TabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.unselectedItemTintColor = UIColor.black
        
        setTabBar()
        self.tabBar.tintColor = UIColor.black
    }
    
    func setTabBar() {
        guard let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController"),
              let shortsVC = self.storyboard?.instantiateViewController(withIdentifier: "ShortsViewController"),
              let addVC = self.storyboard?.instantiateViewController(withIdentifier: "AddViewController"),
              let subscribeVC = self.storyboard?.instantiateViewController(withIdentifier: "SubscribeViewController"),
              let libraryVC = self.storyboard?.instantiateViewController(withIdentifier: "LibraryViewController")
                
        else { return }
        
        homeVC.tabBarItem.title = "Home"
        homeVC.tabBarItem.image = UIImage(named: "home")
        homeVC.tabBarItem.selectedImage = UIImage(named: "homefill")
        
        
        
        shortsVC.tabBarItem.title = "Shorts"
        shortsVC.tabBarItem.image = UIImage(named: "shorts")
        shortsVC.tabBarItem.selectedImage = UIImage(named: "shorts")
        
        addVC.tabBarItem.title = "추가"
        addVC.tabBarItem.image = UIImage(named: "add")
        addVC.tabBarItem.selectedImage = UIImage(named: "add")
        
        subscribeVC.tabBarItem.title = "구독"
        subscribeVC.tabBarItem.image = UIImage(named: "subs")
        subscribeVC.tabBarItem.selectedImage = UIImage(named: "subsfill")
        
        libraryVC.tabBarItem.title = "보관함"
        libraryVC.tabBarItem.image = UIImage(named: "library")
        libraryVC.tabBarItem.selectedImage = UIImage(named: "libraryfill")
        
        setViewControllers([homeVC,shortsVC,addVC,subscribeVC,libraryVC], animated: true)
        
    }

}
