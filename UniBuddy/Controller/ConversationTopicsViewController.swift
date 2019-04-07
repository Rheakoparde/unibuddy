//
//  ConversationTopicsViewController.swift
//  UniBuddy
//
//  Created by Rhea Koparde on 4/6/19.
//  Copyright © 2019 Rhea Koparde. All rights reserved.


import Foundation
import UIKit

class ConversationTopicsViewController:UIViewController {
    @IBOutlet var stressButton: UIButton!
    @IBOutlet var anxietyButton: UIButton!
    @IBOutlet var depressionButton: UIButton!
    @IBOutlet var addictionButton: UIButton!
    @IBOutlet var eatingDisorderButton: UIButton!

    override func viewDidLoad() {
        createGradient()
        formatButtons(button: stressButton)
        formatButtons(button: anxietyButton)
        formatButtons(button: depressionButton)
        formatButtons(button: addictionButton)
        formatButtons(button: eatingDisorderButton)
    }

    func formatButtons(button: UIButton){
        button.backgroundColor = .clear
        button.layer.cornerRadius = 24
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
    }
    
    func createGradient(){
        let layer = CAGradientLayer()
        let bottomColor = UIColor(red: 79.0/255.0, green: 49.0/255.0, blue: 160.0/255.0, alpha: 1.0)
        let topColor = UIColor(red: 224.0/255.0, green: 157.0/255.0, blue: 210.0/255.0, alpha: 1.0)
        layer.frame = view.bounds
        layer.colors = [topColor.cgColor, bottomColor.cgColor]
        view.layer.insertSublayer(layer, at: 0)
    }
}
