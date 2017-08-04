//
//  TTMViewController.swift
//  TTM
//
//  Created by Budharaju, Ganesh on 04/08/17.
//  Copyright © 2017 Budharaju, Ganesh. All rights reserved.
//

import UIKit

class TTMViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
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
