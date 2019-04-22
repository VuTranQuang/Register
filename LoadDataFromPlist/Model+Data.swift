//
//  Model+Data.swift
//  LoadDataFromPlist
//
//  Created by Vu on 4/22/19.
//  Copyright © 2019 Vu. All rights reserved.
//

import Foundation


struct GetCityDemo {
    var name: String
    var codeCity: Int
    init(name: String, codeCity: Int) {
        self.name = name
        self.codeCity = codeCity
    }
}


class DataServiceDemo {
    class func getCity() -> [GetCityDemo] {
        var citiesDemo: [GetCityDemo] = []
        if let path = Bundle.main.path(forResource: "Cities", ofType: "plist"),
            let dictionary = NSDictionary(contentsOfFile: path) as? Dictionary<AnyHashable, Any> {
            if let arrayCities = dictionary["Cities"] as? [Dictionary<AnyHashable, Any>] {
                for city in arrayCities {
                    let cityOneDemo = GetCityDemo(name: city["Name"] as! String, codeCity: city["CityCode"] as! Int)
                    citiesDemo.append(cityOneDemo)
                }
            }
        }
        return citiesDemo
        
    }
}
