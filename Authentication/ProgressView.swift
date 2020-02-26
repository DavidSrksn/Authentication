//
//  ProgressView.swift
//  Authentication
//
//  Created by David Sarkisyan on 26.02.2020.
//  Copyright © 2020 DavidS & that's all. All rights reserved.
//

import UIKit

final class ProgressView: UIProgressView{
    
    let progressNumber: Float = 2
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupProgressView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func updateProgress(completion: ()-> Void){
        let progress: Float = self.progress + Float(1) / progressNumber
        self.setProgress(progress, animated: true)
        
        checkProgress(completion: completion)
    }
    
    private func setupProgressView(){
        tintColor = .black
        trackTintColor = .clear
        
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1
        
        layer.cornerRadius = 5
    }
    
    private func checkProgress(completion: ()->Void){
        if progress == 1{
            completion()
        }
    }
    
}
