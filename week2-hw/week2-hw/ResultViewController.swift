//
//  ResultViewController.swift
//  week2-hw
//
//  Created by 이경민 on 2021/10/11.
//

import UIKit

class ResultViewController: UIViewController, UITabBarDelegate {

    @IBOutlet weak var titleImageView: UIImageView!
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    @IBOutlet weak var okButton: UIButton!
    
    @IBOutlet weak var anotherAccountButton: UIButton!
    
    var name : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func setNameFromOthers(){
        if let userName = name {
            if(userName.count>0){
                welcomeLabel.text="\(userName)님\n환영합니다!"
            }
        }
    }
    
    @IBAction func touchUpToGoNext(_ sender: Any) {
        
//        var mainBoard = UIStoryboard(name: "Tabbar", bundle: nil)
//        var tabbar: UITabBarController? = (mainBoard.instantiateViewController(withIdentifier: "TabbarController") as? UITabBarController)
//        navigationController?.pushViewController(rootViewController : tabbar)
        
    }
    
    @IBAction func touchUpToGoLogIn(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}
