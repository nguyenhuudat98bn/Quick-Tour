//
//  HomeViewController.swift
//  LoginFaceBook
//
//  Created by nguyễn hữu đạt on 7/3/18.
//  Copyright © 2018 nguyễn hữu đạt. All rights reserved.
//

import UIKit
import FBSDKLoginKit
class HomeViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    static var instance: HomeViewController = {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        return storyBoard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = UserDefaults.standard.object(forKey: "name") as? String
//        imageView.download(from: UserDefaults.standard.object(forKey: "url") as! String)
//            = UserDefaults.standard.object(forKey: "url") as? UIImage
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func logout(_ sender: UIBarButtonItem) {
        let logOutManager = FBSDKLoginManager()
        logOutManager.logOut()
        FBSDKAccessToken.setCurrent(nil)
        FBSDKProfile.setCurrent(nil)
        UserDefaults.standard.removeObject(forKey: "Me")
        dismiss(animated: true, completion: nil)
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
