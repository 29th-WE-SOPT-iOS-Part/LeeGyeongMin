//
//  ResultViewController.swift
//  week1-hw
//
//  Created by 이경민 on 2021/10/05.
//

import UIKit

class ResultViewController: UIViewController {

    
    //labels
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var showNameLabel: UILabel!
    @IBOutlet weak var welcomeLabel: UILabel!
    
    //button
    @IBOutlet weak var okButton: UIButton!

    var name : String? //이름을 받아올 string

    override func viewDidLoad() {
        super.viewDidLoad()
        setNameInLabel()
        // Do any additional setup after loading the view.
    }
    
    func setNameInLabel() {
        if let _name = name {
            if(_name == ""){
                showNameLabel.text="OOO님"
            }
            else {
                var pass : String?
                pass=_name+"님"
                showNameLabel.text=pass
            }
        } else {
        }
    }
    
    @IBAction func touchUpToEnd(_ sender: Any) {
        //확인버튼 누르면 끝남 (뒤로가기?)
        self.dismiss(animated: true, completion: nil)
    }
    

}
