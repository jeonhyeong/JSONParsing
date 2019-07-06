//
//  Weather.swift
//  JSONParsing
//
//  Created by 조전형 on 2019/07/06.
//  Copyright © 2019 cho. All rights reserved.
//

import Foundation

struct CurrentWeather:Decodable {
    let weather:[WeatherDetail]
    let main:MainDetail
    let name:String
}

struct WeatherDetail:Decodable {
    let main:String
    let description:String
}

struct MainDetail:Decodable {
    let temp:Float
}

struct WeatherInfo {
    let name:String
    let weather:String
    let temp:Float
}
