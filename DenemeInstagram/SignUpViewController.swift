//
//  SignUpViewController.swift
//  DenemeInstagram
//
//  Created by Bekir Tura on 03/07/2017.
//  Copyright © 2017 Done. All rights reserved.
//

import UIKit
import Parse

class SignUpViewController: UIViewController , UIImagePickerControllerDelegate ,UINavigationControllerDelegate{
    // Txt
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var rePasswordTxt: UITextField!
    @IBOutlet weak var fullnameTxt: UITextField!
    @IBOutlet weak var bioTxt: UITextField!
    @IBOutlet weak var webTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!

    // ImageView
    @IBOutlet weak var avatarImg: UIImageView!
    
     // ScrollView
    @IBOutlet weak var scrollView: UIScrollView!
    // Btn
    
    // Attirbute
    // Reset Default Size
    var scrollViewHeight: CGFloat = 0;
    // Keyboard Frame Size
    var keyboard = CGRect();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        scrollView.frame = CGRect.init(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        scrollView.contentSize.height = self.view.frame.height
        scrollViewHeight = scrollView.frame.height
        
        NotificationCenter.default.addObserver(self, selector: #selector(showKeyboard), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector:#selector(hideKeyboard)
            , name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        
        let hideTap = UITapGestureRecognizer(target:self,action: #selector(hideKeyboardTap))
        hideTap.numberOfTapsRequired = 1
    
        self.view.isUserInteractionEnabled =  true
        self.view.addGestureRecognizer(hideTap)
        
        avatarImg.layer.cornerRadius = avatarImg.frame.size.width/2
        avatarImg.clipsToBounds = true
        
        let avaTap =  UITapGestureRecognizer.init(target: self, action: #selector(loadImg))
        avaTap.numberOfTapsRequired = 1
        avatarImg.isUserInteractionEnabled =  true
        avatarImg.addGestureRecognizer(avaTap)
        // Do any additional setup after loading the view.
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        avatarImg.image = info[UIImagePickerControllerEditedImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
   
    
    // Call Picker Select Image
    func loadImg(recoginezer:UITapGestureRecognizer){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    
    
    
    func hideKeyboardTap(recoginezer:UITapGestureRecognizer){
        self.view.endEditing(true)
    }
    
    
    func hideKeyboard(notification:Notification){
        UIView.animate(withDuration: 0.4) {
            () -> Void in
            self.scrollView.frame.size.height = self.view.frame.height
            
        }
    }
    
    func showKeyboard(notification:Notification){
        keyboard = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey]as! NSValue).cgRectValue
        UIView.animate(withDuration: 0.4) { 
            () -> Void in
            self.scrollView.frame.size.height = self.scrollViewHeight - self.keyboard.height
            
        }
        
    }
    @IBAction func signUpBtn_click(_ sender: Any) {
        if((usernameTxt.text?.isEmpty)! || (passwordTxt.text?.isEmpty)! || (rePasswordTxt.text?.isEmpty)! || (emailTxt.text?.isEmpty)! || (bioTxt.text?.isEmpty)! || (webTxt.text?.isEmpty)! || (fullnameTxt.text?.isEmpty)!){
            let alert = UIAlertController.init(title: "Please!", message: "fill all fields", preferredStyle: UIAlertControllerStyle.alert)
            let ok = UIAlertAction.init(title: "Ok", style: UIAlertActionStyle.cancel, handler: nil)
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
        }else if(passwordTxt.text != rePasswordTxt.text){
            let alert = UIAlertController.init(title: "Password!", message: "do not match", preferredStyle: UIAlertControllerStyle.alert)
            let ok = UIAlertAction.init(title: "Ok", style: UIAlertActionStyle.cancel, handler: nil)
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
        }else {
            let user = PFUser()
            user.username = usernameTxt.text
            user.email = emailTxt.text
            user.password = passwordTxt.text
            user["fullname"] = fullnameTxt.text?.lowercased()
            user["bio"] = bioTxt.text?.lowercased()
            user["web"] = webTxt.text?.lowercased()
            user["web"] = webTxt.text?.lowercased()
            user["tel"] = ""
            user["gender"] = ""

            let avaData = UIImageJPEGRepresentation(avatarImg.image!, 0.5)
            let avaFile = PFFile(name:"ava.jpg",data: avaData!)
            user["avatar"] = avaFile
            user.signUpInBackground(block: { (success, error) in
                if(success){
                    print("registered")
                }else {
                    print(error?.localizedDescription)
                }
            } )



            
        }
        
    }

    @IBAction func cancelBtn_Click(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
