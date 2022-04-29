//
//  FirebaseCodable.swift
//  Giftatte22
//
//  Created by duck on 2022/04/21.
//

import Foundation

struct Gift: Codable{
    let highPrice: Int
    let imageUrl: String
    let keyword: String
    let lowPrice: Int
    let meanPrice: Int
    let rank: Int
    let score: Int
    let webUrl: String
//    let webUrl: URL
}
