//
//  JoinViewController.swift
//  week2-hw
//
//  Created by 이경민 on 2021/10/11.
//

import UIKit

class JoinViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var titleImageView: UIImageView!
    @IBOutlet weak var joinTitleLabel: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var contactTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var showPasswordLabel: UILabel!
    
    @IBOutlet weak var showPasswordButton: UIButton!
    
    @IBOutlet weak var nextButton: UIButton!
    
    
    @objc func textFieldDidChange(_ textField : UITextField) {
        if(nameTextField.hasText && contactTextField.hasText && passwordTextField.hasText){
            nextButton.isEnabled = true
        }
        else {
            nextButton.isEnabled = false
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.isEnabled = false
        nameTextField.delegate = self
        contactTextField.delegate = self
        passwordTextField.delegate = self
        nameTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        contactTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)

    }
    
    @IBAction func touchUpToShowPassword(_ sender: Any) {
        showPasswordButton.isSelected = !showPasswordButton.isSelected
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
    }
    
    @IBAction func touchUpToGoNext(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController else {return}
        
        nextVC.name = nameTextField.text
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true){
            self.navigationController?.popViewController(animated: true )
        }
    }
    
}
