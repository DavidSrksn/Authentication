//
//  SignupViewController.swift
//  Authentication
//
//  Created by David Sarkisyan on 27.02.2020.
//  Copyright © 2020 DavidS & that's all. All rights reserved.
//

import UIKit

class MainViewController: UIViewController{    
    var alertIsShown: Bool = false
    var blurView = UIVisualEffectView()
    let finishLabel = UILabel()
    
    let headerLabel = UILabel()
    
    let leftTab: CGFloat = 20
    let topTab: CGFloat = 30
    
    let personImageLabel = UILabel()
    let personFullNameLabel = UILabel()
    let personAgeLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Main"
        navigationItem.setup(type: .main)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        view.backgroundColor = .cyan
        setupPeopleProfile()
        if !alertIsShown{
            setupBlurView()
            setupLabel()
            alertIsShown = true
        }
    }
    
    func setupBlurView(){
        let blurEffect = UIBlurEffect(style: .extraLight)
        blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = view.frame
        blurView.isOpaque = true
        view.addSubview(blurView)
    }
    
    func setupLabel(){
        view.addSubview(finishLabel)
                
        finishLabel.translatesAutoresizingMaskIntoConstraints = false
        
        finishLabel.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        finishLabel.heightAnchor.constraint(equalToConstant: 70).isActive = true
        finishLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        finishLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        finishLabel.textAlignment = .center
        finishLabel.font = UIFont(name: "HelveticaNeue", size: 50)
        finishLabel.text = "Logged in \u{2713}"
        finishLabel.textColor = .purple
        finishLabel.alpha = 0
        
        UIView.animate(withDuration: 1.2, animations: {
            self.finishLabel.alpha = 1
        }){ (bool) in
            UIView.animate(withDuration: 0.5, animations: {
                self.finishLabel.alpha = 0
            }) { (bool) in
                self.finishLabel.removeFromSuperview()
                self.blurView.removeFromSuperview()
            }
        }
    }
    
    func setupPeopleProfile(){
        setupHeaderLabel()
        setupPeopleImageView()
        setupPersonAgeLabel()
        setupPersonNameLabel()
    }
    
    func setupHeaderLabel(){
        view.addSubview(headerLabel)
        
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        headerLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: leftTab).isActive = true
        headerLabel.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        headerLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: topTab).isActive = true
        
        headerLabel.font = UIFont(name: "HelveticaNeue", size: 35)
        headerLabel.text = "Personal Account"
        headerLabel.textColor = .purple
        headerLabel.textAlignment = .left
    }
    
    func setupPeopleImageView(){
        view.addSubview(personImageLabel)
        
        personImageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        personImageLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: leftTab).isActive = true
        personImageLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        personImageLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        personImageLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: topTab).isActive = true
        
        personImageLabel.layer.cornerRadius = 50
        personImageLabel.layer.borderColor = UIColor.purple.cgColor
        personImageLabel.layer.borderWidth = 3
        
        personImageLabel.text = "Photo"
        personImageLabel.textColor = .black
        personImageLabel.textAlignment = .center
    }
    
    func setupPersonNameLabel(){
        view.addSubview(personFullNameLabel)
        
        personFullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        personFullNameLabel.leftAnchor.constraint(equalTo: personImageLabel.leftAnchor).isActive = true
        personFullNameLabel.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        personFullNameLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        personFullNameLabel.topAnchor.constraint(equalTo: personImageLabel.bottomAnchor, constant: 50).isActive = true
        
        let fullName = Person.shared.fullName ?? "Not stated yet"
        
        personFullNameLabel.textAlignment = .left
        personFullNameLabel.textColor = .purple
        personFullNameLabel.text = "FullName: \(fullName )"
    }
    
    func setupPersonAgeLabel(){
        view.addSubview(personAgeLabel)
        
        personAgeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        personAgeLabel.leftAnchor.constraint(equalTo: personImageLabel.rightAnchor, constant: 50).isActive = true
        personAgeLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        personAgeLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        personAgeLabel.bottomAnchor.constraint(equalTo: personImageLabel.bottomAnchor).isActive = true
        
        let age = (Person.shared.age != nil) ? "\(String(describing: Person.shared.age))" : "Not stated yet"
        personAgeLabel.textAlignment = .center
        personAgeLabel.textColor = .purple
        personAgeLabel.text = "Age: \(age)"
    }
    
}
