//
//  File.swift
//  Authentication
//
//  Created by David Sarkisyan on 26.02.2020.
//  Copyright © 2020 DavidS & that's all. All rights reserved.
//

import UIKit

final class SignupViewController: UIViewController{
    
    let headerLabel = UILabel()
    
    let stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = .black
        setupHeader()
        setupStackView()
    }
    
    func setupStackView(){
        view.addSubview(stackView)
        stackView.center = view.center
    }
    
    func setupHeader(){
        view.addSubview(headerLabel)
        
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        headerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        headerLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        headerLabel.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        headerLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        headerLabel.textColor = .white
        headerLabel.font = UIFont(name: "HelveticaNeue", size: 45)
        headerLabel.text = "Регистрация"
        headerLabel.textAlignment = .center
    }
}
