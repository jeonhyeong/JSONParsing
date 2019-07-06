//
//  Weather.swift
//  JSONParsing
//
//  Created by 조전형 on 2019/07/06.
//  Copyright © 2019 cho. All rights reserved.
//

import Foundation

struct CurrentWeather:Codable {
    let weather:[WeatherDetail]
    let main:MainDetail
    let name:String
}

struct WeatherDetail:Codable {
    let main:String
    let description:String
}

struct MainDetail:Codable {
    let temp:Float
}

struct WeatherInfo {
    let name:String
    let weather:String
    let temp:Float
}
