//
//  ChatViewController.swift
//  UniBuddy
//
//  Created by Rhea Koparde on 4/6/19.
//  Copyright © 2019 Rhea Koparde. All rights reserved.
//

import UIKit
import MessengerKit
// import Parse

// Get current user: let user = PFUser.current()
// let id = user.uid

public class User: MSGUser {
    public init(displayName: String, avatar: UIImage?, isSender: Bool) {
        self.displayName  = displayName
        self.avatar = avatar
        self.isSender = isSender
    }
    
    /// The name that will be displayed on the cell
    public var displayName: String
    
    /// The avatar for the user.
    public var avatar: UIImage?
    
    /// Whether this user is the one sending messages.
    /// This is used to determine which bubble is rendered.
    public var isSender: Bool

    
}

class ChatViewController: MSGMessengerViewController{

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    var nickname:String!
    
    // Users in the chat
    
    let me = User(displayName: "Me", avatar: nil, isSender: true)
    
    let tim = User(displayName: "Erika", avatar: nil, isSender: false)
    
    // Messages
    
    lazy var messages: [[MSGMessage]] = {
        return [
            [
                MSGMessage(id: 1, body: .text("Hey, what's been bothering you?"), user: tim, sentAt: Date()),
                //MSGMessage(id: 3, body: .text("I've been going through the same thing. Have you tried mindfulness meditation?"), user: tim, sentAt: Date()),
                //MSGMessage(id: 4, body: .text("That really helped for me."), user: tim, sentAt: Date())
            ]
        ]
    }()
    
    func getNickname() -> String{
        return self.nickname
    }
    
    // Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
    }
    
    override func inputViewPrimaryActionTriggered(inputView: MSGInputView){
        let msgBody = MSGMessageBody.text(inputView.message)
        let msg = MSGMessage(id: 4, body: msgBody, user: me, sentAt: Date())
        insert(msg)
    }
    
    override func insert(_ message: MSGMessage) {
        
        collectionView.performBatchUpdates({
            if let lastSection = self.messages.last, let lastMessage = lastSection.last, lastMessage.user.displayName == message.user.displayName {
                self.messages[self.messages.count - 1].append(message)
                
                let sectionIndex = self.messages.count - 1
                let itemIndex = self.messages[sectionIndex].count - 1
                self.collectionView.insertItems(at: [IndexPath(item: itemIndex, section: sectionIndex)])
                
            } else {
                self.messages.append([message])
                let sectionIndex = self.messages.count - 1
                self.collectionView.insertSections([sectionIndex])
            }
        }, completion: { (_) in
            self.collectionView.scrollToBottom(animated: true)
            self.collectionView.layoutTypingLabelIfNeeded()
        })
        
    }
    
    override func insert(_ messages: [MSGMessage], callback: (() -> Void)? = nil) {
        
        collectionView.performBatchUpdates({
            for message in messages {
                if let lastSection = self.messages.last, let lastMessage = lastSection.last, lastMessage.user.displayName == message.user.displayName {
                    self.messages[self.messages.count - 1].append(message)
                    
                    let sectionIndex = self.messages.count - 1
                    let itemIndex = self.messages[sectionIndex].count - 1
                    self.collectionView.insertItems(at: [IndexPath(item: itemIndex, section: sectionIndex)])
                    
                } else {
                    self.messages.append([message])
                    let sectionIndex = self.messages.count - 1
                    self.collectionView.insertSections([sectionIndex])
                }
            }
        }, completion: { (_) in
            self.collectionView.scrollToBottom(animated: false)
            self.collectionView.layoutTypingLabelIfNeeded()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                callback?()
            }
        })
        
    }
    
}


extension ChatViewController: MSGDataSource {
    
    func numberOfSections() -> Int {
        return messages.count
    }
    
    func numberOfMessages(in section: Int) -> Int {
        return messages[section].count
    }
    
    func message(for indexPath: IndexPath) -> MSGMessage {
        return messages[indexPath.section][indexPath.item]
    }
    
    func footerTitle(for section: Int) -> String? {
        return "Just now"
    }
    
    func headerTitle(for section: Int) -> String? {
        return messages[section].first?.user.displayName
    }
    
}
