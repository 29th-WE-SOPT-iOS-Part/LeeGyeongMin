//
//  ResultViewController.swift
//  29th-week1-seminar
//
//  Created by 이경민 on 2021/10/02.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var dataLabel: UILabel!
    var message: String? //안정성을 위해 옵셔널로 선언
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setMessageInLabel()
    }
    
    func setMessageInLabel(){
        if let msg = message { //옵셔널 바인딩으로 안전하게 값 꺼내기 (nil 아니면 꺼냄)
            dataLabel.text=msg
            dataLabel.sizeToFit()
        }
    }
    @IBAction func touchUpGoBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
