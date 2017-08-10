//
//  TTMViewController.swift
//  TTM
//
//  Created by Budharaju, Ganesh on 04/08/17.
//  Copyright © 2017 Budharaju, Ganesh. All rights reserved.
//

import UIKit
import Foundation

class TTMViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextViewDelegate
{
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var inputContainerView: UIView!
    @IBOutlet weak var icvBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var ttmTextView: UITextView!
    
    var messages: [AnyObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.tableView.contentInset = UIEdgeInsetsMake(-60, 0, 0, 0)
        
        NotificationCenter.default.addObserver(self, selector: #selector(TTMViewController.keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(TTMViewController.keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(TTMViewController.hideKeyboard))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    func hideKeyboard() {
        self.view.endEditing(true)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        
        
        let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as! CGRect).size
        self.view.layoutIfNeeded()
        UIView.animate(withDuration: 0.3) {
            self.icvBottomConstraint.constant = keyboardSize.height
            self.view.layoutIfNeeded()
        }
        
    }
    
    func keyboardWillHide(notification: NSNotification) {
        self.view.layoutIfNeeded()
        UIView.animate(withDuration: 0.3) {
            self.icvBottomConstraint.constant = 0
            self.view.layoutIfNeeded()
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.messages.count
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return UITableViewAutomaticDimension
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let value = self.messages[indexPath.row]
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell", for: indexPath)
        
        if value is TTMMessage
        {
            if cell is TTMSenderMessageCell
            {
                let messageCell: TTMSenderMessageCell! = cell as! TTMSenderMessageCell
                
                
                messageCell.messageLabel.text = value.message
                
                messageCell.messageLabel.sizeToFit()
                
            }
        }
        else if value is TTMResponse
        {
            if cell is TTMSenderMessageCell
            {
                cell = tableView.dequeueReusableCell(withIdentifier: "ResponseCell", for: indexPath)
                
                let messageCell: TTMSenderMessageCell! = cell as! TTMSenderMessageCell
                
                
                messageCell.messageLabel.text = value.message
                
                messageCell.messageLabel.sizeToFit()
                
            }
        }
        
        
        
        return cell
    }
    
    
    @IBAction func sendButtonTapped(button: UIButton)
    {
        
        if let message = ttmTextView.text
        {
            let newMessage = TTMMessage()
            newMessage.message = message;
            self.messages.append(newMessage)
            
            let newResponse = TTMResponse()
            newResponse.message = message;
            self.messages.append(newResponse)
        }
        
        self.tableView.reloadData()
        
        ttmTextView.text = "";
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
