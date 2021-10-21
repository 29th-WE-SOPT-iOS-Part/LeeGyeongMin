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
        setNameFromOthers()
    }
    
    func setNameFromOthers(){
        if let userName = name {
            if(userName.count>0){
                welcomeLabel.text="\(userName)님\n환영합니다!"
            }
        }
    }
    
    @IBAction func touchUpToGoNext(_ sender: Any) {

        
    }
    
    @IBAction func touchUpToGoLogIn(_ sender: Any) {
        let nowVC = self.presentingViewController
        
        self.dismiss(animated: true){
            
            guard let rootVC = nowVC as? UINavigationController else {return}
            rootVC.popToRootViewController(animated: false)
        
        }
    }
    
}
