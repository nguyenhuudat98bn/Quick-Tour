//
//  Your User.swift
//  LoginFaceBook
//
//  Created by nguyễn hữu đạt on 6/27/18.
//  Copyright © 2018 nguyễn hữu đạt. All rights reserved.
//
import Foundation
typealias DICT = Dictionary<AnyHashable, Any>
class User: NSObject, NSCoding {
    var id: String
    var name: String
    var url: String
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: "id")
        aCoder.encode(name, forKey: "name")
        aCoder.encode(url, forKey: "url")
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let id = aDecoder.decodeObject(forKey: "id") as? String ?? "-1"
        let name = aDecoder.decodeObject(forKey: "name") as? String ?? "-1"
        let url = aDecoder.decodeObject(forKey: "url") as? String ?? "-1"
        self.init(id: id, name: name, url: url)
    }
    
    init(id: String, name: String, url: String) {
        self.id = id
        self.name = name
        self.url = url
    }
    
    func save(with key: String) {
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: self)
        UserDefaults.standard.set(encodedData, forKey: key)
    }
    
    static func get(with key: String) -> User? {
        var user: User?
        if let decoded = UserDefaults.standard.object(forKey: key) as? Data {
            user = NSKeyedUnarchiver.unarchiveObject(with: decoded) as? User
        }
        return user
    }
}
