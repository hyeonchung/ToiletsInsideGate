//
//  APIManager.swift
//  Week5_ToiletInsideGate
//
//  Created by 정현준 on 2021/10/13.
//

import Foundation
import UIKit
import Alamofire

class APIManager {

    static let shared = APIManager()

    var myList: [data] = [] // Mylist

}
extension SearchViewController {
    func fetchData() {
        let url = "https://api.odcloud.kr/api/15041263/v1/uddi:c8eacebc-1aa7-403c-8f0c-f70ce072fd4e?page=1&perPage=332&serviceKey=KyfjaaAxbPc8klWY49HHylbYVgZcOWUu1fuTWFwKAc9Mfcx3wwCxQ8PUKgKZlfIFcXUgDgFpjf8Jwh21EMbDAg%3D%3D"
        let request = AF.request(url, method: .get, headers: nil)
        request.responseDecodable(of: APIResponse.self) { (response) in
            debugPrint(response)
            switch response.result {
            case .success(let res):
                self.dataSource = res.data.filter({ $0.게이트내외 == "내"}).sorted{ $0.선명 < $1.선명 }
                DispatchQueue.main.async {
                    self.searchTableView.reloadData()
                }
                print("self.dataSource: \(self.dataSource)")
            case .failure(let error):
                print("에러!: \(error.localizedDescription)")
            }
        }
    }
}
