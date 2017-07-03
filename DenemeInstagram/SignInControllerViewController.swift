//
//  SignInControllerViewController.swift
//  DenemeInstagram
//
//  Created by Bekir Tura on 03/07/2017.
//  Copyright © 2017 Done. All rights reserved.
//

import UIKit

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
    }

}
