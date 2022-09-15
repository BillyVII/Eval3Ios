//
//  cryptoLive.swift
//  Eval3Ios
//
//  Created by Student09 on 14/09/2022.
//

import Foundation

struct CryptoData : Codable {
    var data : [CryptoLive]

}
struct CryptoLive : Codable {
    var rank: String
    var name: String
    var priceUsd: String
    var changePercent24Hr: String
}
struct CryptoDetails : Codable {
    var priceUsd: String
    // var time: Float
    var date: String
}
