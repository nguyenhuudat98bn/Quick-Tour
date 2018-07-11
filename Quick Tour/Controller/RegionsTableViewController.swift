//
//  RegionsTableViewController.swift
//  Quick Tour
//
//  Created by nguyễn hữu đạt on 7/9/18.
//  Copyright © 2018 nguyễn hữu đạt. All rights reserved.
//

import UIKit

class RegionsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
        
        cell.textLabel?.text = Regions.fromHashValue(hashValue: indexPath.row)?.rawValue

        return cell
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let indexPath = tableView.indexPathForSelectedRow {
            let placesTableViewController = segue.destination as? PlacesTableViewController
            placesTableViewController?.regions = Regions.fromHashValue(hashValue: indexPath.row)
        }
    }
    @IBAction func backButton(_ sender: Any){
        dismiss(animated: true, completion: nil)
    }
}
