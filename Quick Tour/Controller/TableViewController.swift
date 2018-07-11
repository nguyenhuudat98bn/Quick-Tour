//
//  TableViewController.swift
//  
//
//  Created by nguyễn hữu đạt on 7/4/18.
//

import UIKit

class TableViewController: UITableViewController {
    
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
        return DataService.shared.tour.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
            cell.labelCountry.text = DataService.shared.tour[indexPath.row].country
            cell.labelName.text = DataService.shared.tour[indexPath.row].name
            cell.labelTour.text = DataService.shared.tour[indexPath.row].tour
            cell.labelTicket.text = DataService.shared.tour[indexPath.row].ticket
            cell.labelTop.text = DataService.shared.tour[indexPath.row].top
            cell.ratingControl.rating = DataService.shared.tour[indexPath.row].rating
            cell.imageCountry.image = DataService.shared.tour[indexPath.row].photoCountry
            cell.labelTourGuide.text = DataService.shared.tour[indexPath.row].tourGuide
        
        
        // Configure the cell...

        return cell
    }
    @IBAction func toPlace(_ sender: UILabel){
    }
    @IBAction func backButton(_ sender: Any){
        dismiss(animated: true, completion: nil)
    }

}
