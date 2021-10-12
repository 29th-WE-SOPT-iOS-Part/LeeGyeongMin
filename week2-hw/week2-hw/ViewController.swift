//
//  ViewController.swift
//  week2-hw
//
//  Created by 이경민 on 2021/10/10.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var titleImageView: UIImageView!
    @IBOutlet weak var logInTitleLabel: UILabel!
    @IBOutlet weak var explainLabel: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var contactTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var createAccountButton: UIButton!
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
    
    override func viewWillAppear(_ animated: Bool) {
        nameTextField.text?.removeAll()
        contactTextField.text?.removeAll()
        passwordTextField.text?.removeAll()
    }
    @IBAction func touchUpToCreateAccount(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "JoinViewController") as?
                JoinViewController else {return}
        
        nextVC.viewWillAppear(false)
        self.navigationController?.pushViewController(nextVC, animated: true)
        
    }
    
    @IBAction func touchUpToGoNext(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController else {return}
        
        nextVC.name = nameTextField.text
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true, completion: nil)
    }
    
    
}

