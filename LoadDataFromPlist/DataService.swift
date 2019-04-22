//
//  ViewController.swift
//  LoadDataFromPlist
//
//  Created by Vu on 4/10/19.
//  Copyright © 2019 Vu. All rights reserved.
//

import UIKit


struct GetCity  {
    var name: String
    var codeCity: Int
    init(name: String, codeCity: Int) {
        self.name = name
        self.codeCity = codeCity
    }
}

struct GetDistrict {
    var name: String
    var codeDistrict: Int
    var codeCity: Int
    init(name: String, codeCity: Int, codeDistrict: Int) {
        self.name = name
        self.codeDistrict = codeDistrict
        self.codeCity = codeCity
    }
}
class DataService {
    class func getCityOfPlist() -> [GetCity] {
        var cities: [GetCity] = []
        if let path = Bundle.main.path(forResource: "Cities", ofType: "plist"),
            let dictionaryCity = NSDictionary(contentsOfFile: path) as? Dictionary<AnyHashable, Any> {
            if let arrayCity = dictionaryCity["Cities"] as? [Dictionary<AnyHashable, Any>] {
                for city in arrayCity {
                    let cityOne = GetCity(name: city["Name"] as! String, codeCity: city["CityCode"] as! Int)
                    cities.append(cityOne)
                }
            }
        }
        return cities
        
    }
    
    class func getDistrictsOfPlist() -> [GetDistrict]  {
        var districts: [GetDistrict] = []
        if let path = Bundle.main.path(forResource: "Districts", ofType: "plist"),
            let dictionaryDistrict = NSDictionary(contentsOfFile: path) as? Dictionary<AnyHashable, Any> {
            if let arrayDistrict = dictionaryDistrict["Districts"] as? [Dictionary<AnyHashable, Any>] {
                for district in arrayDistrict {
                    let districOne = GetDistrict(name: district["Name"] as! String, codeCity: district["CityCode"] as! Int, codeDistrict: district["DistrictCode"] as! Int )
                    districts.append(districOne)
                }
            }
        }
        return districts
    }
}

