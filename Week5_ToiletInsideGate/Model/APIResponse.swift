//
//  APIResponse.swift
//  Week5_ToiletInsideGate
//
//  Created by 정현준 on 2021/10/16.
//

import Foundation

struct APIResponse: Decodable, Equatable {
    var currentCount: Int
    var data: [data]
    var matchCount: Int
    var page: Int
    var perPage: Int
    var totalCount: Int
}

struct data: Decodable, Equatable {
    var 게이트내외: String
    var 남녀구분코드: String
    var 상세위치: String
    var 선명: String
    var 역명: String
//    var 화장실의 역층: String
}
