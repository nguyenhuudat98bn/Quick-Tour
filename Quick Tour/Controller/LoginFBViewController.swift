//
//  ViewController.swift
//  LoginFaceBook
//
//  Created by nguyễn hữu đạt on 7/3/18.
//  Copyright © 2018 nguyễn hữu đạt. All rights reserved.
//

import UIKit
import FBSDKLoginKit
class LoginFBViewController: UIViewController {
    
    let fbloginManager: FBSDKLoginManager = FBSDKLoginManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func login(_ sender: UIButton){
        fbloginManager.logIn(withReadPermissions: ["public_profile", "email"], from: self) { (result, error) in
            if error == nil{
                if let loginResult = result {
                    if loginResult.grantedPermissions != nil {
                        self.getFBUserData()
                    }
                }
                else{
                    print("Login False")
                }
            }
        }
    }
    func getFBUserData(){
        FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, picture.type(large), email"]).start(completionHandler: { (connection, result, error) -> Void in
            if (error == nil){
                guard let info = result as? DICT else { return }
                guard let picture = info["picture"] as? DICT else {return}
                guard let data = picture["data"] as? DICT else {return}
                guard let url = data["url"] as? String else {return}
                guard let id = info["id"] as? String else {return}
                guard let name = info["name"] as? String else {return}
                let user = User(id: id, name: name, url: url)
                user.save(with: "user")
//                UserDefaults.standard.object(forKey: "name")
                UserDefaults.standard.set(name, forKey: "name")
                UserDefaults.standard.set(url, forKey: "url")
                print(name, url)
                //                self.performSegue(withIdentifier: "showHome", sender: nil)
                self.presentHomeViewController()
            }
        })
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func presentHomeViewController() {
        present(HomeViewController.instance, animated: true, completion: nil)
    }
  
    
}

