//
//  ViewController.swift
//  29th-week1-seminar
//
//  Created by 이경민 on 2021/10/02.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tsetButton: UIButton!
    @IBOutlet weak var testLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchUpChangeLabel(_ sender: Any) {
        testLabel.text="바꿈"
    }
    
    @IBAction func touchUpToGoSecondView(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController")
        else{return}
        
        self.navigationController?.pushViewController(nextVC, animated: true)
//        nextVC.modalPresentationStyle = .fullScreen
//        nextVC.modalTransitionStyle = .crossDissolve
//
//        self.present(nextVC,animated: true,completion: nil)
    }
    
    

}

