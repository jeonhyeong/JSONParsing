//
//  ViewController.swift
//  JSONParsing
//
//  Created by 조전형 on 2019/05/01.
//  Copyright © 2019 cho. All rights reserved.
//

import UIKit
import CoreLocation

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
    let temp:Double
}

class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    let locationManager = CLLocationManager()
    var weatherResult: CurrentWeather?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        indicator.startAnimating()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let coor = manager.location?.coordinate {
            let URLStr = "http://api.openweathermap.org/data/2.5/weather?lat=\(coor.latitude)&lon=\(coor.longitude)&appid=\(weatherAPI)"
            URLSession.shared.dataTask(with: URL(string: URLStr)!, completionHandler: {(data, response, error) -> Void in
                do {
                    guard let data = data else {return}
                    self.weatherResult = try JSONDecoder().decode(CurrentWeather.self, from: data)
                    DispatchQueue.main.sync {
                        self.indicator.stopAnimating()
                        self.performSegue(withIdentifier: "weather", sender: nil)
                    }
                } catch {
                    print("decode error : \(error)")
                }
            }).resume()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "weather" {
            let name = weatherResult!.name
            let weather = weatherResult!.weather[0].main
            let temp = weatherResult!.main.temp
            let weatherView = segue.destination as! WeatherViewController
            weatherView.weatherInfo = WeatherViewController.WeatherInfo(name: name, weather: weather, temp: temp)
        }
    }
}

