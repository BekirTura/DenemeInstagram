//
//  ViewController.swift
//  DenemeInstagram
//
//  Created by Done on 05/06/2017.
//  Copyright © 2017 Done. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {

    @IBOutlet weak var picture: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //
        let data = UIImageJPEGRepresentation(picture.image!, 0.5)
        
        let file = PFFile(name: "picture.jpg", data: data!)
        
        let object = PFObject(className:"Message")
        object["sender"] = "Bekir"
        object["receiver"] =  "Tura"
        object["picture"] =  file
        object.saveInBackground { (done, error) in
            if(done){
                print("saved");
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

