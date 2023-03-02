//
//  WeatherData.swift
//  Clima
//
//  Created by Onur Duyar on 19.02.2023.
//  Copyright © 2023 App Brewery. All rights reserved.
//

/*
    decodable -> get data from JSON
    encodable -< send data to JSON
 
    Codable --> Encodable + Decodable
 typealias Codable = Decodable & Encodable
 */
import Foundation

struct WeatherData: Decodable{
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Decodable{
    let temp: Double
}

struct Weather: Decodable {
    let description: String
    let id: Int
}
