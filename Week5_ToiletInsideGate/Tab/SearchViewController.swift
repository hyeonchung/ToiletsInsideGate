//
//  SearchViewController.swift
//  Week5_ToiletInsideGate
//
//  Created by 정현준 on 2021/10/11.
//

import UIKit
import Alamofire

class SearchViewController: UIViewController {
    var dataSource: [data] = []

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
}


extension SearchViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(dataSource.count)
        return dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StationListTableViewCell", for: indexPath) as! StationListTableViewCell
        let toilet = dataSource[indexPath.row]
        cell.updateTableCell(item: toilet)
        return cell
    }
}

