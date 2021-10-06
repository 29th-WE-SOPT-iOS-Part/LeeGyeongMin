//
//  SecondViewController.swift
//  week1-hw
//
//  Created by 이경민 on 2021/10/05.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    //labels
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var joinLabel: UILabel!
    @IBOutlet weak var showPasswordLabel: UILabel!
    
    //textfields
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var contactTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    //buttons
    @IBOutlet weak var showPasswordButton: UIButton!
    @IBOutlet weak var joinEndedButton: UIButton!
    
    var nameFieldOn : Bool = false
    var contactFieldOn : Bool = false
    var passwordFieldOn : Bool = false
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if let _name = nameTextField.text {
            if (_name.count>=1){
            nameFieldOn = true
        }
        else {
            nameFieldOn = false
        }
    } else{
        nameFieldOn = false
    }
    
    if let _contact = contactTextField.text {
        if (_contact.count>=1){
            contactFieldOn = true
        }
        else{
            contactFieldOn = false
        }
    } else{
        contactFieldOn = false
    }
    
    if let _password = passwordTextField.text {
        if (_password.count>=1){
            passwordFieldOn = true
        }
        else{
            passwordFieldOn = false
        }
    } else{
        passwordFieldOn = false
    }
    
    if(nameFieldOn == true && contactFieldOn == true && passwordFieldOn == true){
        joinEndedButton.isEnabled = true
    }
        else{
            joinEndedButton.isEnabled = false;
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        joinEndedButton.isEnabled=false
        nameTextField.delegate=self
        contactTextField.delegate=self
        passwordTextField.delegate=self
        nameTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        contactTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @IBAction func touchUpToShowPassword(_ sender: Any) {
        //누르면 비밀번호 표시
        //네모 체크된 네모로 바꿔야함
        
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
        
        showPasswordButton.isSelected = !showPasswordButton.isSelected
        
    }
    
    @IBAction func touchUpToEndJoin(_ sender: Any) {
        //회원가입 끝남
        //환영합니다 화면으로 넘어가기
        //이름 정보 전달해주기
        
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController else {return}
        
        nextVC.name = nameTextField.text
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true, completion: nil)
    
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
