//
//  ViewController.swift
//  Authentication
//
//  Created by David Sarkisyan on 25.02.2020.
//  Copyright © 2020 DavidS & that's all. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController, UITextFieldDelegate {

    let progressBar = ProgressView(frame: .zero)
    
    let stackView = UIStackView()
    
    let loginTextField = UITextField()
    let passwordTextField = UITextField()
    
    let loginButton = UIButton()
    let signupButton = UIButton()
    
    let logoLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginTextField.delegate = self
        passwordTextField.delegate = self
        view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupTextField(textField: loginTextField, placeHolder: "Login")
        setupTextField(textField: passwordTextField, placeHolder: "Password")
        setupStackVIew()
        setupLoginButton()
        setupSignupButton()
        setupProgressBar()
        setupLogo()
    }
    
    func setupTextField(textField: UITextField, placeHolder: String){
        textField.placeholder = placeHolder
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 0)
        
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.darkGray.cgColor
        
        stackView.addArrangedSubview(textField)
    }
    
    func setupStackVIew(){
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        
        stackView.tintColor = .black
        
        stackView.layer.borderColor = UIColor.black.cgColor
        stackView.layer.borderWidth = 5
        stackView.layer.cornerRadius = loginTextField.layer.cornerRadius
        
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: view.frame.width * 0.8).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: stackView.bounds.height).isActive = true
        
        stackView.arrangedSubviews.last?.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        stackView.arrangedSubviews.first?.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }

    func setupLogo(){
        view.addSubview(logoLabel)
        
        logoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        logoLabel.bottomAnchor.constraint(equalTo: progressBar.topAnchor, constant: -5).isActive = true
        logoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        logoLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        logoLabel.textAlignment = .center
        logoLabel.font = UIFont(name: "HelveticaNeue", size: 30)
        logoLabel.text = "\"LOGO\""
    }

    func setupLoginButton(){
        loginButton.addTarget(.none, action: #selector(loginButtonAction), for: .touchUpInside)
        view.addSubview(loginButton)
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        loginButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 15).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        loginButton.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 20)
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        
        loginButton.alpha = 0.5
        
        loginButton.layer.cornerRadius = loginTextField.layer.cornerRadius
        loginButton.backgroundColor = .black
    }
    
    @objc func loginButtonAction(){
        checkData(login: loginTextField.text!, password: passwordTextField.text!)
    }
    
    func setupProgressBar(){
        view.addSubview(progressBar)
        
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        
        progressBar.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -30).isActive = true
        progressBar.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        progressBar.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        progressBar.heightAnchor.constraint(equalToConstant: 10).isActive = true
    }
    
    func checkData(login: String, password: String){
        if  login != "", password != ""{
            progressBar.updateProgress {
                loginButton.alpha = 1
            }
        }else if login == "", password == ""{
            showWarning(message: "Fill the textfields")
        }else if login == ""{
            
        }else if password == ""{
            showWarning(message: "Incorrect password")
        }
    }
    
    func setupSignupButton(){
        view.addSubview(signupButton)
        
        signupButton.translatesAutoresizingMaskIntoConstraints = false
        
        signupButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 10).isActive = true
        signupButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        signupButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        signupButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        signupButton.setTitle("Sign up", for: .normal)
        signupButton.setTitleColor(.systemBlue, for: .normal)
        signupButton.titleLabel?.textAlignment = .center
    }
    
}



extension AuthViewController {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        var key: String?
        if textField === loginTextField{
            key = "login"
        }else if textField === passwordTextField{
            key = "password"
        }
        
        if let key = key,textField.isCorrect(key: key){
            textField.resignFirstResponder()
            return true
        }else{
            return false
        }
    }
}

