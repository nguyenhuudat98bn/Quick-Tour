//
//  DetailPlacesViewController.swift
//  Quick Tour
//
//  Created by nguyễn hữu đạt on 7/9/18.
//  Copyright © 2018 nguyễn hữu đạt. All rights reserved.
//

import UIKit

class DetailPlacesViewController: UIViewController {
    var receive: Place?
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imagePlace: UIImageView!
    @IBOutlet weak var inforPlace: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let indexpath = receive {
            nameLabel.text = indexpath.name
            imagePlace.download(from: indexpath.image)
            inforPlace.text = indexpath.content
        }
        
        // Do any additional setup after loading the view.
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
