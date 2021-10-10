//
//  CustomTabbarController.swift
//  29-week2-seminar
//
//  Created by 이경민 on 2021/10/09.
//

import UIKit

class CustomTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabbar()
        // Do any additional setup after loading the view.
    }
    
    func setTabbar(){
        guard let orangeVC = self.storyboard?.instantiateViewController(withIdentifier: "OrangeVC"),
                let purpleVC = self.storyboard?.instantiateViewController(withIdentifier: "PurpleVC")
        else { return }
        
        orangeVC.tabBarItem.title = "Home"
        orangeVC.tabBarItem.image = UIImage(systemName: "house")
        orangeVC.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        purpleVC.tabBarItem.title = "Profile"
        purpleVC.tabBarItem.image = UIImage(systemName: "person")
        purpleVC.tabBarItem.selectedImage = UIImage(systemName: "person.fill")
        
        
        setViewControllers([orangeVC,purpleVC], animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
