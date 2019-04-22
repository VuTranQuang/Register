//
//  PlistServices.swift
//  LoadDataFromPlist
//
//  Created by Vu on 4/22/19.
//  Copyright © 2019 Vu. All rights reserved.
//

import Foundation

class PlistServices {
    func getDictionary(plist: String) -> Dictionary<AnyHashable, Any>? {
        var result: Dictionary<AnyHashable, Any>?
        let fileNameComponent = plist.components(separatedBy: ".")
        guard let filePath = Bundle.main.path(forResource: fileNameComponent.first ?? "", ofType: fileNameComponent.last ?? "") else {
            return nil
        }
        guard FileManager.default.fileExists(atPath: filePath) == true else {
            return nil
        }
        guard let data = FileManager.default.contents(atPath: filePath) else {
            return nil
        }
        do {
            guard let root = try PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? Dictionary<AnyHashable, Any> else {
                return nil
            }
            result = root
            
        } catch {
            print("Error: PropertyListSerialization error")
        }
        return result
    }
    
}
