//
//  CurrencyViewModel.swift
//  CurrencyAPI
//
//  Created by Barış Can Akkaya on 9.06.2021.
//

import Foundation

struct CurrencyViewModel {
    let currencyModel: CurrencyModel?
}

extension CurrencyViewModel {
    init(_ currencyModel: CurrencyModel) {
        self.currencyModel = currencyModel
    }
    
    var base: String {
        return self.currencyModel?.base ?? "nil"
    }
    
    var rates: [String: Double] {
        return currencyModel?.rates ?? ["nil": 3.14]
    }
    
}

