//
//  LoginVC.swift
//  MessengerClone
//
//  Created by Amirkhouzam on 25/03/2022.
//

import UIKit

class LoginVC: UIViewController {
    
    let scrollview : UIScrollView = {
       let view = UIScrollView()
        view.clipsToBounds = true
        return view
    }()
    let imageview : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "logo")
        return image
    }()
    let emailfield : UITextField = {
       let field = UITextField()
        field.textColor = .black
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.placeholder = "Email address"
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.returnKeyType = .next
        field.layer.cornerRadius = 15
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.leftViewMode = .always
        field.backgroundColor = .white
       return field
    }()
    let passwordfield : UITextField = {
       let field = UITextField()
        field.textColor = .black
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.placeholder = "Password"
        field.leftView = UIView(frame: CGRect(x: 0,y: 0, width: 5,height: 0))
        field.leftViewMode = .always
        field.returnKeyType = .done
        field.layer.cornerRadius = 15
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.isSecureTextEntry = true
        
       return field
    }()
    let loginbutton : UIButton = {
       let button = UIButton()
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        
       return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Login"
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Register",
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(self.Didtapregister))
        
        view.addSubview(scrollview)
        scrollview.addSubview(imageview)
        scrollview.addSubview(emailfield)
        scrollview.addSubview(passwordfield)
        scrollview.addSubview(loginbutton)
        loginbutton.addTarget(self, action: #selector(self.Didtaplogin), for: .touchUpInside)
        emailfield.delegate = self
        passwordfield.delegate = self
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scrollview.frame = view.bounds
        let frame = scrollview.frame.width/3
        imageview.frame = CGRect(x: frame,
                                 y: 20,
                                 width: frame,
                                 height: frame)
        emailfield.frame = CGRect(x: 30,
                                  y: imageview.bottom + 20,
                                  width: scrollview.width - 60,
                                  height: 50)
        passwordfield.frame = CGRect(x: 30,
                                     y: emailfield.bottom + 20,
                                     width: scrollview.width - 60,
                                     height: 50)
        loginbutton.frame = CGRect(x: 30,
                                   y: passwordfield.bottom + 20,
                                   width: scrollview.width - 60,
                                   height: 50)
        
    }
    @objc func Didtapregister(){
        let vc = RegisterVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func Didtaplogin(){
        
        emailfield.becomeFirstResponder()
        passwordfield.becomeFirstResponder()
        
        guard let email = emailfield.text , let password = passwordfield.text , !email.isEmpty , !password.isEmpty , password.count >= 8 else {
            alerterrorlogin()
            return
        }
        //TODO :- Firebase login
        
    }
    func alerterrorlogin(){
        let alert = UIAlertController(title: "OOPS !!", message: "Please enter your email and password ", preferredStyle: .alert)
        let alertaction = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        alert.addAction(alertaction)
        present(alert, animated: true, completion: nil)
    }
   

}

extension LoginVC : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if emailfield == textField {
            passwordfield.becomeFirstResponder()
        }else if passwordfield == textField{
            Didtaplogin()
        }
        
        
        return true
    }
    
}
