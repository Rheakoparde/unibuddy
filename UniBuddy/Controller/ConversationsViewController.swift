//
//  ConversationsViewController.swift
//  UniBuddy
//
//  Created by Student on 4/7/19.
//  Copyright © 2019 Rhea Koparde. All rights reserved.
//

import Foundation
import UIKit

class ConversationsViewController:UIViewController, UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let conversation = tableView.dequeueReusableCell(withIdentifier: "Conversation")!
        return conversation
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 3
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let namesArray = ["Erika", "Vanessa", "Meryl"]
//        let subtitleArray = ["Talking about anxiety", "Talking about stress", "Talking about stress"]
//
//        let conversation = tableView.dequeueReusableCell(withIdentifier: "Conversation")!
//        conversation.textLabel?.text = namesArray[indexPath.row]
//        conversation.detailTextLabel?.text = subtitleArray[indexPath.row]
//        return conversation
//    }
    
//    // Override to support editing the table view.
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        }
//    }
}
