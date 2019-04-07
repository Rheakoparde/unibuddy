//
//  ConversationTypeViewController.swift
//  UniBuddy
//
//  Created by Rhea Koparde on 4/6/19.
//  Copyright © 2019 Rhea Koparde. All rights reserved.
//

import Foundation
import UIKit

class ConversationTypeViewController:UIViewController{
    @IBOutlet var singleButton: UIButton!
    @IBOutlet var groupButton: UIButton!
    //@IBOutlet weak var nicknameTextField: UITextField!
    @IBOutlet weak var oneHelpButton: UIButton!
    @IBOutlet weak var groupHelpButton: UIButton!
    @IBOutlet weak var oneHelpLabel: UILabel!
    @IBOutlet weak var groupHelpLabe: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createGradient()
        formatButtons(button: oneHelpButton)
        formatButtons(button: groupHelpButton)
        oneHelpLabel.isHidden = true
        groupHelpLabe.isHidden = true
    }
    
    func createGradient(){
        let layer = CAGradientLayer()
        let bottomColor = UIColor(red: 79.0/255.0, green: 49.0/255.0, blue: 160.0/255.0, alpha: 1.0)
        let topColor = UIColor(red: 224.0/255.0, green: 157.0/255.0, blue: 210.0/255.0, alpha: 1.0)
        layer.frame = view.bounds
        layer.colors = [topColor.cgColor, bottomColor.cgColor]
        view.layer.insertSublayer(layer, at: 0)
    }
    
    func formatButtons(button: UIButton){
        button.backgroundColor = .clear
        button.layer.cornerRadius = 75
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.gray.cgColor
    }
    
    @IBAction func oneOnOneHelp(_ sender: UIButton) {
        oneHelpLabel.isHidden = !oneHelpLabel.isHidden
    }

    @IBAction func groupHelp(_ sender: UIButton) {
        groupHelpLabe.isHidden = !groupHelpLabe.isHidden
    }
    
    @IBAction func editingDidEnd(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }

    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "startMessaging", let chatViewController = segue.destination as? ChatViewController {
            let myNickname = nicknameTextField.text
            chatViewController.nickname = myNickname
        }
    }
 */
    
}
