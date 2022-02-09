//
//  stationListTableViewCell.swift
//  Week5_ToiletInsideGate
//
//  Created by 정현준 on 2021/10/16.
//

import UIKit

class StationListTableViewCell : UITableViewCell {

    let shared = APIManager.shared

    @IBOutlet weak var lineNumImg: UIImageView!
    @IBOutlet weak var stationLabel: UILabel!
    @IBOutlet weak var lineNumLabel: UILabel!
    @IBOutlet weak var exitNumLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!

    @IBAction func addToFavorite(_ sender: UIButton) {
        let addedToilet = data(게이트내외: "내", 남녀구분코드: "", 상세위치: exitNumLabel.text!, 선명: lineNumLabel.text!, 역명: stationLabel.text!)
        favoriteButton.isSelected = !favoriteButton.isSelected
        let status = favoriteButton.isSelected
        if status {
            print("isSelected: \(favoriteButton.isSelected)")
            shared.myList.append(addedToilet)
        }else{
            print("isSelected: \(favoriteButton.isSelected)")
            guard let firstIndex = shared.myList.firstIndex(of: addedToilet) else {return}
            shared.myList.remove(at: firstIndex)
        }
    }
}

extension StationListTableViewCell {
    func updateTableCell(item: data?) {
        guard let toilet = item else {return}
        stationLabel.text = "\(toilet.역명) (\(toilet.남녀구분코드))"
        lineNumLabel.text = toilet.선명
        exitNumLabel.text = toilet.상세위치
    }
}

