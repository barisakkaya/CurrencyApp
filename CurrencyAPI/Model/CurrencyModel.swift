//
//  CurrencyModel.swift
//  CurrencyAPI
//
//  Created by Barış Can Akkaya on 9.06.2021.
//

import Foundation

struct CurrencyModel: Codable{
    var base: String
    var rates: [String: Double]
}
