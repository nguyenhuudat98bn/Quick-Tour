//
//  BookTickerViewController.swift
//  Quick Tour
//
//  Created by nguyễn hữu đạt on 7/5/18.
//  Copyright © 2018 nguyễn hữu đạt. All rights reserved.
//

import UIKit

class ScheduleViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func popView(_ sender: Any){
        dismiss(animated: true, completion: nil)
    }

}
