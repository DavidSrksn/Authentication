//
//  SignupViewController.swift
//  Authentication
//
//  Created by David Sarkisyan on 27.02.2020.
//  Copyright © 2020 DavidS & that's all. All rights reserved.
//

import UIKit

class MainViewController: UIViewController{

    let finishLabel = UILabel()
    
    override func viewWillAppear(_ animated: Bool) {
        view.backgroundColor = .cyan
        setupLabel()
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
        finishLabel.text = "Logged in"
        finishLabel.textColor = .purple
    }
}
