//
//  ResetPasswordViewController.swift
//  DenemeInstagram
//
//  Created by Bekir Tura on 03/07/2017.
//  Copyright © 2017 Done. All rights reserved.
//

import UIKit
import Parse

class ResetPasswordViewController: UIViewController {

    
    @IBOutlet weak var emailTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func cancelBtn_Click(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func resetBtn_click(_ sender: Any) {
        self.view.endEditing(true)
        if(emailTxt.text?.isEmpty)!{
            let alert = UIAlertController.init(title: "Please!", message: "fill all fields", preferredStyle: UIAlertControllerStyle.alert)
            let ok = UIAlertAction.init(title: "Ok", style: UIAlertActionStyle.cancel, handler: nil)
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
        }else {
            PFUser.requestPasswordResetForEmail(inBackground: emailTxt.text!, block: { (success, error) in
                if(success){
                    let alert = UIAlertController.init(title: "Email for resetting password!", message: "hass been sent to texted email", preferredStyle: UIAlertControllerStyle.alert)
                    let ok = UIAlertAction.init(title: "Ok", style: UIAlertActionStyle.default, handler: { (UIAlertAction) in
                         self.dismiss(animated: true, completion: nil)
                    })
                    alert.addAction(ok)
                    self.present(alert, animated: true, completion: nil)

                }
            })
        }
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
