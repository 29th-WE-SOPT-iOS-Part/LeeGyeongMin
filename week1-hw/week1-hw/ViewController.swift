//
//  ViewController.swift
//  week1-hw
//
//  Created by 이경민 on 2021/10/05.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    //labels
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var logInTitleLabel: UILabel!
    
    @IBOutlet weak var explainLabel: UILabel!
    
    //textfields
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var contactTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    //buttons
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var logInButton: UIButton!

    var nameFieldOn : Bool = false
    var contactFieldOn : Bool = false
    var passwordFieldOn : Bool = false
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if let _name = nameTextField.text {
        if (_name == ""){
            nameFieldOn = false
        }
        else {
            nameFieldOn = true
        }
    } else{
        nameFieldOn = false
    }
    
    if let _contact = contactTextField.text {
        if (_contact == ""){
            contactFieldOn = false
        }
        else{
            contactFieldOn = true
        }
    } else{
        contactFieldOn = false
    }
    
    if let _password = passwordTextField.text {
        if (_password == ""){
            passwordFieldOn = false
        }
        else{
            passwordFieldOn = true
        }
    } else{
        passwordFieldOn = false
    }
    
    if(nameFieldOn == true && contactFieldOn == true && passwordFieldOn == true){
        logInButton.isEnabled = true
    }
        else{
            logInButton.isEnabled = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logInButton.isEnabled=false
        nameTextField.delegate=self
        contactTextField.delegate=self
        passwordTextField.delegate=self
        nameTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        contactTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }

    @IBAction func touchUpToCreateAccount(_ sender: Any) {
        //계정만들기 버튼 누름
        //계정 만들기 창으로 push!
        guard let nextVC=self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as?
                SecondViewController else {return}
        self.navigationController?.pushViewController(nextVC, animated: true)
         
    }
    
    @IBAction func touchUpToLogIn(_ sender: Any) {
        //다음 버튼 누름
        //환영합니다 창으로 present!
        //이름 정보 전달해주기(data전달)
    
        //버튼의 상태가 disable 아닐때만 가능!!
        guard let nextVC=self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController else {return}
        
        nextVC.name=nameTextField.text
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC,animated: true,completion: nil)
    }
    
}

