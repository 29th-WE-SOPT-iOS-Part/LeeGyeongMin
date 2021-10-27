import UIKit

class TabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
    }
    
    func setTabBar() {
        
        
        guard let homeVC = self.storyboard?.instantiateViewController(identifier: "HomeVC"),
              let shortsVC = self.storyboard?.instantiateViewController(identifier: "ShortsVC"),
              let addVC = self.storyboard?.instantiateViewController(identifier: "AddVC"),
              let subscribeVC = self.storyboard?.instantiateViewController(identifier: "SubscribeVC"),
              let libraryVC = self.storyboard?.instantiateViewController(identifier: "LibraryVC")
        else {return}
        
        homeVC.tabBarItem.title = "Home"
        homeVC.tabBarItem.image = UIImage(named: "homeIcon")
        homeVC.tabBarItem.selectedImage = UIImage(named: "homeIconFill")
        
        shortsVC.tabBarItem.title = "Shorts"
        shortsVC.tabBarItem.image = UIImage(named: "shortsIcon")
        shortsVC.tabBarItem.selectedImage = UIImage(named: "shortsIconFill")
        
        addVC.tabBarItem.title = "추가"
        addVC.tabBarItem.image = UIImage(named: "circleIcon")
        addVC.tabBarItem.selectedImage = UIImage(named: "circleIcon")
        
        subscribeVC.tabBarItem.title = "구독"
        subscribeVC.tabBarItem.image = UIImage(named: "subsIcon")
        subscribeVC.tabBarItem.selectedImage = UIImage(named: "subsIconFill")
        
        libraryVC.tabBarItem.title = "보관함"
        libraryVC.tabBarItem.image = UIImage(named: "LibraryIcon")
        libraryVC.tabBarItem.selectedImage = UIImage(named: "LibraryIconFill")
        
        
        self.tabBar.unselectedItemTintColor = UIColor.black
        self.tabBar.tintColor = UIColor.black
        
        setViewControllers([homeVC,shortsVC,addVC,subscribeVC,libraryVC], animated: true)
    }
}
