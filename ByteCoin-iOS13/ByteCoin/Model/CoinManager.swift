//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "F06D2B60-7257-471E-B304-18FDDD1B6163"
    var delegate: CoinManagerDelegate?
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    func getCoinPrice(for currency: String){
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        self.performRequest(with: urlString,with: currency)
    }
    
    func performRequest(with urlString: String, with currency: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        let urlRequest = URLRequest(url: url)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: urlRequest) { data, response, error in
            if error != nil {
                self.delegate?.didFailWithError(error!)
                return
            }
            if let data {
                guard let price = parseJSON(data) else {
                    return
                }
                let priceString = String(format: "%.2f", price)
                delegate?.didUpdatePrice(price: priceString, currency: currency)
            }
        }
        task.resume()
    }
    
    func parseJSON(_ data: Data) -> Double? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoinData.self, from: data)
            let lastPrice = decodedData.rate
            return lastPrice
        } catch{
            print(error.localizedDescription)
            return nil
        }
    }
}

// MARK: - CoinManager Protocol

protocol CoinManagerDelegate {
    func didUpdatePrice(price: String,currency: String)
    func didFailWithError(_ error: Error)
}
