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
            self.tableView.setContentOffset(CGPoint(x: 0, y: self.tableView.contentSize.height - 280), animated: true)
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
        
        return 3
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return UITableViewAutomaticDimension
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell", for: indexPath)
        
        if cell is TTMSenderMessageCell
        {
            let messageCell: TTMSenderMessageCell! = cell as! TTMSenderMessageCell
            messageCell.messageLabel.text = "Test ganesh 123 first AI Test Test ganesh 123 first AI Test Test ganesh 123 first AI Test Test ganesh 123 first AI Test Test ganesh 123 first AI Test Test ganesh 123 first AI Test Test ganesh 123 first AI Test Test ganesh 123 first AI Test Test ganesh 123 first AI Test Test ganesh 123 first AI Test Test ganesh 123 first AI Test Test ganesh 123 first AI Test Test ganesh 123 first AI Test Test ganesh 123 first AI Test Test ganesh 123 first AI Test Test ganesh 123 first AI Test Test ganesh 123 first AI Test Test ganesh 123 first AI Test Test ganesh 123 first AI Test Test ganesh 123 first AI Test Test ganesh 123 first AI Test Test ganesh 123 first AI Test Test ganesh 123 first AI Test Test ganesh 123 first AI Test Test ganesh 123 first AI Test Test ganesh 123 first AI Test Test ganesh 123 first AI Test Test ganesh 123 first AI Test"
            messageCell.messageLabel.sizeToFit()
            
        }
        
        return cell
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
