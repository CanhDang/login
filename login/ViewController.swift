//
//  ViewController.swift
//  login
//
//  Created by HuuLuong on 7/12/16.
//  Copyright © 2016 CanhDang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tf_user: UITextField!
    
    @IBOutlet weak var tf_password: UITextField!
    
    
    @IBOutlet weak var btn_del: UIButton!
    

    @IBOutlet weak var btn_update: UIButton!
    
    
    var users = ["canh":"123","an":"1234","tien":"5678"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        btn_del.hidden = true
        btn_update.hidden = true
        
    }
    
    
    @IBAction func action_login(sender: UIButton) {
        if let password = users[tf_user.text!]{
            
            if password == tf_password.text{
                print("Dang nhap thanh cong")
                showAlertDialog()
                btn_del.hidden = false
                btn_update.hidden = false
            } else {
                print("Mat khau khong dung")
            }
                
        } else {
            print("Tai khoan khong ton tai")
        }
    }

    
    @IBAction func action_viewListOfUsers(sender: UIButton) {
        if users.isEmpty {
            print("Don't have any user")
        } else {
            for userName in users.keys{
                print(userName)
            }
            showListOfUsers()
        }
    }
    
    func showAlertDialog(){
        
        let alert = UIAlertController(title: "Welcome", message: "You have logined successfully! ", preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    func showListOfUsers(){
        
        var list: String = ""
        for user in users{
            list = list + user.0 + " " + user.1 + "\n"
        }
        
        let alert = UIAlertController(title: "List of Users", message: list, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    
    @IBAction func action_delAcc(sender: UIButton) {
        users[tf_user.text!] = nil
        btn_del.hidden = true
        btn_update.hidden = true
    }
    
    
    @IBAction func action_updateAcc(sender: UIButton) {
        users.updateValue(tf_password.text!, forKey: tf_user.text!)
        btn_del.hidden = true
        btn_update.hidden = true
    }
    
}

