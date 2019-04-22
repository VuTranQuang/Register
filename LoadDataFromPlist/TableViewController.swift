//
//  TableViewController.swift
//  LoadDataFromPlist
//
//  Created by Vu on 4/10/19.
//  Copyright © 2019 Vu. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    var city: [GetCity] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        city = DataService.getCityOfPlist()
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return city.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = city[indexPath.row].name
        cell.detailTextLabel?.text = "\(city[indexPath.row].codeCity)"
        return cell
    }
    
}

