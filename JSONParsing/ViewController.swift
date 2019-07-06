//
//  ViewController.swift
//  JSONParsing
//
//  Created by 조전형 on 2019/05/01.
//  Copyright © 2019 cho. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    let locationManager = CLLocationManager()
    var weatherInfo: WeatherInfo?
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        indicator.startAnimating()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == CLAuthorizationStatus.denied {
            indicator.stopAnimating()
            setWeather(nil, false)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let coor = manager.location?.coordinate {
            let param = "lat=\(coor.latitude)&lon=\(coor.longitude)"
            let URLStr = "https://devcho.herokuapp.com/weather?"+param
            URLSession.shared.dataTask(with: URL(string: URLStr)!, completionHandler: {(weatherData, response, error) -> Void in
                do {
                    guard error == nil else {
                        DispatchQueue.main.sync {
                            self.indicator.stopAnimating()
                            self.setWeather(nil, false)
                        }
                        return
                    }
                    guard let data = weatherData else {return}
                    let weatherResult = try JSONDecoder().decode(CurrentWeather.self, from: data)
                    self.weatherInfo = WeatherInfo(name: weatherResult.name, weather: weatherResult.weather[0].main, temp: weatherResult.main.temp)
                    self.setWeatherImage(weather: self.weatherInfo!.weather)
                } catch {
                    self.weatherImage.image = UIImage(named: "fail.png")
                    self.showLabel(result: false)
                }
            }).resume()
        }
    }
    
    func setWeather(_ weatherInfo: WeatherInfo?, _ result: Bool) {
        if result {
            nameLabel.text = weatherInfo!.name
            weatherLabel.text = weatherInfo!.weather
            tempLabel.text = String(Int(weatherInfo!.temp - 273.15)) + "°C"
            showLabel(result: true)
        } else {
            weatherImage.image = UIImage(named: "fail.png")
            showLabel(result: false)
        }
    }
    
    func showLabel(result: Bool) {
        if result {
            nameLabel.alpha = 1.0
            weatherLabel.alpha = 1.0
            tempLabel.alpha = 1.0
        } else {
            errorLabel.alpha = 1.0
        }
    }
    
    func setWeatherImage(weather: String) {
        switch weather {
        case "Thunderstorm":
            let urlSTR = "http://openweathermap.org/img/w/11d.png"
            URLSession.shared.dataTask(with: URL(string: urlSTR)!, completionHandler: {(data, response, error) -> Void in
                guard let data = data else {return}
                DispatchQueue.main.sync {
                    self.indicator.stopAnimating()
                    self.setWeather(self.weatherInfo, true)
                    self.weatherImage.image = UIImage(data: data)
                }
            }).resume()
        case "Drizzle":
            let urlSTR = "http://openweathermap.org/img/w/09d.png"
            URLSession.shared.dataTask(with: URL(string: urlSTR)!, completionHandler: {(data, response, error) -> Void in
                guard let data = data else {return}
                DispatchQueue.main.sync {
                    self.indicator.stopAnimating()
                    self.setWeather(self.weatherInfo, true)
                    self.weatherImage.image = UIImage(data: data)
                }
            }).resume()
        case "Rain":
            let urlSTR = "http://openweathermap.org/img/w/10d.png"
            URLSession.shared.dataTask(with: URL(string: urlSTR)!, completionHandler: {(data, response, error) -> Void in
                guard let data = data else {return}
                DispatchQueue.main.sync {
                    self.indicator.stopAnimating()
                    self.setWeather(self.weatherInfo, true)
                    self.weatherImage.image = UIImage(data: data)
                }
            }).resume()
        case "Snow":
            let urlSTR = "http://openweathermap.org/img/w/13d.png"
            URLSession.shared.dataTask(with: URL(string: urlSTR)!, completionHandler: {(data, response, error) -> Void in
                guard let data = data else {return}
                DispatchQueue.main.sync {
                    self.indicator.stopAnimating()
                    self.setWeather(self.weatherInfo, true)
                    self.weatherImage.image = UIImage(data: data)
                }
            }).resume()
        case "Mist":
            let urlSTR = "http://openweathermap.org/img/w/50d.png"
            URLSession.shared.dataTask(with: URL(string: urlSTR)!, completionHandler: {(data, response, error) -> Void in
                guard let data = data else {return}
                DispatchQueue.main.sync {
                    self.indicator.stopAnimating()
                    self.setWeather(self.weatherInfo, true)
                    self.weatherImage.image = UIImage(data: data)
                }
            }).resume()
        case "Clear":
            let urlSTR = "http://openweathermap.org/img/w/01d.png"
            URLSession.shared.dataTask(with: URL(string: urlSTR)!, completionHandler: {(data, response, error) -> Void in
                guard let data = data else {return}
                DispatchQueue.main.sync {
                    self.indicator.stopAnimating()
                    self.setWeather(self.weatherInfo, true)
                    self.weatherImage.image = UIImage(data: data)
                }
            }).resume()
        case "Clouds":
            let urlSTR = "http://openweathermap.org/img/w/02d.png"
            URLSession.shared.dataTask(with: URL(string: urlSTR)!, completionHandler: {(data, response, error) -> Void in
                guard let data = data else {return}
                DispatchQueue.main.sync {
                    self.indicator.stopAnimating()
                    self.setWeather(self.weatherInfo, true)
                    self.weatherImage.image = UIImage(data: data)
                }
            }).resume()
        default:
            return
        }
    }
}

