//
//  MyListViewController.swift
//  Week5_ToiletInsideGate
//
//  Created by 정현준 on 2021/10/12.
//

import UIKit

class MyListViewController: UIViewController {
    @IBOutlet weak var mylistTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        mylistTableView.layer.cornerRadius = 30
    }
}

extension MyListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

class MyListCell: UITableViewCell {
    let shared = APIManager.shared

    @IBOutlet weak var stationLabel: UILabel!
    @IBOutlet weak var lineNumLabel: UILabel!
    @IBOutlet weak var exitNumLabel: UILabel!
    @IBOutlet weak var lineImg: UIImageView!

    @IBOutlet weak var removeBtn: UIButton!

    @IBAction func didRemoveTapped(_ sender: UIButton) {
        let removedToilet = data(게이트내외: "내", 남녀구분코드: "", 상세위치: exitNumLabel.text!, 선명: lineNumLabel.text!, 역명: stationLabel.text!)
        let status = removeBtn.isSelected
        if status {
            guard let firstIndex = shared.myList.firstIndex(of: removedToilet) else {return}
            shared.myList.remove(at: firstIndex)
        }else{
            print("error")
        }
    }
}
