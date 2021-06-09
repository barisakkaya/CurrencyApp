//
//  ViewController.swift
//  CurrencyAPI
//
//  Created by Barış Can Akkaya on 9.06.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var currencyCollectionView: UICollectionView!
    
    var currencyViewModel: CurrencyViewModel? = nil
    var emptyDictionary = [String: Double]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyCollectionView.delegate = self
        currencyCollectionView.dataSource = self
        
        getDatas()
        
    }
}

extension ViewController {
    func getDatas() {
        let url = URL(string: "https://openexchangerates.org/api/latest.json?app_id=33ae228ad4634d54a6de7f09a46c578c")
        if let url = url {
            Request().httpRequest(url: url) { currencies in
                if let currencies = currencies {
                    self.currencyViewModel = CurrencyViewModel(currencies)
                    DispatchQueue.main.async {
                        self.currencyCollectionView.reloadData()
                    }
                }
            }
        }
    }
    
    func printDict(dic: [String: Double]) {
        for item in dic.keys {
            print(item)
        }
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = self.currencyViewModel?.rates.count {
            return count
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let keysArray: [String] = Array((self.currencyViewModel?.rates.keys)!)
        let cell = currencyCollectionView.dequeueReusableCell(withReuseIdentifier: "currencyCell", for: indexPath) as! CurrencyCollectionViewCell
        
        /// Get CurrentKey
        let currentKey = keysArray[indexPath.row]
        let currentIndexKey : Double = (self.currencyViewModel?.rates[currentKey])!
        
        /// Assign Values
        cell.labelCell.text = "1 USD = \(currentIndexKey) \(currentKey)"
        
        
        
        return cell
        
        
    }
}

