//
//  PlacesTableViewController.swift
//  Quick Tour
//
//  Created by nguyễn hữu đạt on 7/9/18.
//  Copyright © 2018 nguyễn hữu đạt. All rights reserved.
//

import UIKit

class PlacesTableViewController: UITableViewController {
    
    var regions: Regions!
    var places: [Place] = []
    
    var task: URLSessionDownloadTask!
    var session: URLSession!
    var cache: NSCache<NSString, AnyObject>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        if regions != nil {
            DataService.shared.loadPlacesVietname(area: regions) { places in
                self.places = places
                self.tableView.reloadData()
            }
        }
    }
    
    deinit {
        cache.removeAllObjects()
        cache = nil
        session.invalidateAndCancel()
        session = nil
        task.cancel()
        task = nil
        print(cache == nil, session == nil, task == nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setup() {
        cache = NSCache<NSString, AnyObject>()
        cache.countLimit = 30
        cache.totalCostLimit = 10 * 1024 * 1024
        
        session = URLSession.shared
        task = URLSessionDownloadTask()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return places.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PlacesTableViewCell
        cell.imagePlaces.download(from: places[indexPath.row].image)
        cell.informationLabel.text = places[indexPath.row].content
        cell.nameLabel.text = places[indexPath.row].name
        if let urlImage = URL(string: places[indexPath.row].image) {
            if let image = cache.object(forKey: "\(urlImage)" as NSString) as? UIImage {
                cell.imagePlaces.image = image
            } else {
                cell.imagePlaces.alpha = 0
                downloadImageInCell(at: indexPath, with: urlImage)
            }
        }
        
        return cell
    }
    
    func downloadImageInCell(at indexPath: IndexPath, with url: URL) {
        task = session.downloadTask(with: url, completionHandler: { (location, response, error) in
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {[unowned self] in
                    if let cell = self.tableView.cellForRow(at: indexPath) as? PlacesTableViewCell {
                        let image: UIImage! = UIImage(data: data)
                        cell.imagePlaces.image = image
                        UIView.animate(withDuration: 0.3, animations: {
                            cell.imagePlaces.alpha = 1
                        })
                        self.cache.setObject(image, forKey: "\(url)" as NSString)
                    }
                }
            }
        })
        task.resume()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexpath = tableView.indexPathForSelectedRow{
            let viewController = segue.destination as? DetailPlacesViewController
                viewController?.receive = places[indexpath.row]
        }
    }
}
