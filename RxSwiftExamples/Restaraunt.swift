//
//  Restaraunt.swift
//  RxSwiftExamples
//
//  Created by Milandr on 01.11.2020.
//

import Foundation

struct Restaurant: Decodable {
    let name: String
    let cuisine: Cuisine
}

enum Cuisine: String, Decodable {
    case european
    case indian
    case mexican
    case french
    case english
}
