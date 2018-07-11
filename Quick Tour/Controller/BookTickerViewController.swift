//
//  BookTickerViewController.swift
//  Quick Tour
//
//  Created by nguyễn hữu đạt on 7/9/18.
//  Copyright © 2018 nguyễn hữu đạt. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase
class BookTickerViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var arrWeather: [ForeCastDay] = []
    var ref : DatabaseReference!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var phoneText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var addressText: UITextField!
    @IBOutlet weak var dayText: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var cmtText: UITextField!
    @IBOutlet weak var userCmt: UILabel!
    @IBOutlet weak var cmtLabel: UILabel!
    override func viewDidLoad() {
        nameText.text = UserDefaults.standard.object(forKey: "name") as? String
        phoneText.text = UserDefaults.standard.object(forKey: "phone") as? String
        emailText.text = UserDefaults.standard.object(forKey: "email") as? String
        addressText.text = UserDefaults.standard.object(forKey: "address") as? String
        dayText.text = UserDefaults.standard.object(forKey: "day") as? String
        cmtLabel.text = UserDefaults.standard.object(forKey: "cmt") as? String
        
        ref = Database.database().reference()

        super.viewDidLoad()
        DataService.apiWeather { (weather) in
            self.arrWeather = weather.forecastDays
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrWeather.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! WeatherTableViewCell
        cell.dayWeather.text = String(arrWeather[indexPath.row].date_epoch.dayWeek(identifier: "VI"))
        cell.tempcMax.text = String(arrWeather[indexPath.row].maxtemp_c) + "°"
        cell.tempcMin.text = String(arrWeather[indexPath.row].mintemp_c) + "°"
        cell.imageWather.download(from: arrWeather[indexPath.row].icon)
        
        return cell
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func registerInfor(_ sender: Any){
        UserDefaults.standard.set(nameText.text, forKey: "name")
        UserDefaults.standard.set(phoneText.text, forKey: "phone")
        UserDefaults.standard.set(emailText.text, forKey: "email")
        UserDefaults.standard.set(addressText.text, forKey: "address")
        UserDefaults.standard.set(dayText.text, forKey: "day")
        ref.child("name").setValue(nameText.text)
        ref.child("phone").setValue(phoneText.text)
        ref.child("email").setValue(emailText.text)
        ref.child("address").setValue(addressText.text)
        ref.child("day").setValue(dayText.text)
        showAlert(message: "Chúc Quý Khách Có Một Chuyến Du lịch Vui Vẻ!", title: "Đăng Ký Thành Công !")
        
    }
    @IBAction func backButton(_ sender: Any){
        dismiss(animated: true, completion: nil)
    }
    @IBAction func back(_ sender: Any){
        dismiss(animated: true, completion: nil)
    }
    func showAlert(message: String, title: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    @IBAction func sentCmt(_ sender: UIButton){
        UserDefaults.standard.set(cmtText.text, forKey: "cmt")
        ref.child("coment").setValue(cmtText.text)
        userCmt.text = UserDefaults.standard.object(forKey: "name") as? String
        
    }
}
