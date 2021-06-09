//
//  Request.swift
//  CurrencyAPI
//
//  Created by Barış Can Akkaya on 9.06.2021.
//

import Foundation

class Request {
    
    func httpRequest(url: URL, completion: @escaping (CurrencyModel?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }
            else if let data = data, let dataString = String(data: data, encoding: .utf8){
                print("Response data string:\n \(dataString)")
                let currencyList = try? JSONDecoder().decode(CurrencyModel.self, from: data)
                if let currency = currencyList {
                    completion(currency)
                }
            }
            
        }.resume()
        
    }
    
}
