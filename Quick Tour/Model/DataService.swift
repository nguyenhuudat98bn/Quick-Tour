//
//  DataService.swift
//  Quick Tour
//
//  Created by nguyễn hữu đạt on 7/4/18.
//  Copyright © 2018 nguyễn hữu đạt. All rights reserved.
//

import UIKit

enum Regions: String {
    case nortArea = "I. Địa điểm phượt ở miền Bắc"
    case centralArea = "II. Địa điểm phượt ở miền Trung"
    case southArea = "III. Địa điểm phượt miền Nam"
    case westArea = "IV. Địa điểm phượt miền Tây"
        
    static func fromHashValue(hashValue: Int) -> Regions? {
        switch hashValue {
        case 0:
            return .nortArea
        case 1:
            return .centralArea
        case 2:
            return .southArea
        case 3:
            return .westArea
        default:
            return nil
        }
    }
}

class DataService {
    static let shared: DataService = DataService()
    private var _tour: [Tour]?
    var tour: [Tour]{
        get{
            if _tour == nil{
                loadTour()
            }
            return _tour ?? []
        }
        set {
            _tour = newValue
        }
    }
    private func loadTour(){
        _tour = []
        guard let tour1 = Tour(country: "Country: Thái Lan", photoCountry: #imageLiteral(resourceName: "thailan"), rating: 5, tour: "Tour 5 ngày 4 đêm", ticket: "Giá Vé: 6490000 đ", tourGuide: "Hướng Dẫn Viên:", name: "Nguyễn Hữu Đat", top: "Xếp Hạng") else { return }
        _tour = [tour1]
    }
    
    class func apiWeather(complete: @escaping(Weather)-> Void){
        let urlString = "https://api.apixu.com/v1/forecast.json?key=3fbecdbe09474ea48a1160449181806&q=Bangkok&days=7&lang=vi"
        guard let url = URL(string: urlString) else {return}
        let urlRequest = URLRequest(url: url)
        URLSession.shared.dataTask(with: urlRequest) { (data, _, error) in
            guard error == nil else {return}
            guard let aData = data else {return}
            do{
                guard let reSult = try JSONSerialization.jsonObject(with: aData, options: .mutableContainers) as? DICT else {return}
                DispatchQueue.main.async {
                    complete(Weather(dict: reSult))
                }
                
            }
            catch{
                print(error.localizedDescription)
            }
            }.resume()
    }
    
    func loadPlacesVietname(area: Regions, complete: @escaping([Place])->Void) {
        var placesObj: [Place] = []
        DispatchQueue.global().async {
            if let path = Bundle.main.url(forResource: "PlacesVietnam", withExtension: "plist"){
                do {
                    let data = try Data(contentsOf: path)
                    let result = try PropertyListSerialization.propertyList(from: data, options: .mutableContainers, format: nil) as? DICT
                    guard let places = result![area.rawValue] as? [DICT] else {return}
                    for place in places {
                        let placeObj = Place(dict: place)
                        placesObj.append(placeObj)
                    }
                    DispatchQueue.main.async {
                        complete(placesObj)
                    }
                    
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        
    }
    
}
