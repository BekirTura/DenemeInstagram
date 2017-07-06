//
//  SignInControllerViewController.swift
//  DenemeInstagram
//
//  Created by Bekir Tura on 03/07/2017.
//  Copyright © 2017 Done. All rights reserved.
//

import UIKit
import Parse

class SignInControllerViewController: UIViewController {
    // Btn
    @IBOutlet weak var forgotBtn: UIButton!
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var signInBtn: UIButton!
    // txt
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var userNameTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // clicked sign in btn
    @IBAction func signInBtn_click(_ sender: Any) {
        
        self.view.endEditing(true)
        
        if((userNameTxt.text?.isEmpty)! || (passwordTxt.text?.isEmpty)!){
            let alert = UIAlertController.init(title: "Please!", message: "fill all fields", preferredStyle: UIAlertControllerStyle.alert)
            let ok = UIAlertAction.init(title: "Ok", style: UIAlertActionStyle.cancel, handler: nil)
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)

        }else {
            PFUser.logInWithUsername(inBackground: userNameTxt.text!, password: passwordTxt.text!, block: { (user, error) in
                if(error == nil){
                    UserDefaults.standard.set(user?.username, forKey: "username")
                    UserDefaults.standard.synchronize()
                    
                    let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
                    appDelegate.login()
                }
            })
        }
    }

}
