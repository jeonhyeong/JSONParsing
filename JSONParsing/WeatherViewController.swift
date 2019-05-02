//
//  WeatherViewController.swift
//  JSONParsing
//
//  Created by 조전형 on 2019/05/02.
//  Copyright © 2019 cho. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

    public struct WeatherInfo {
        let name:String
        let weather:String
        let temp:Double
    }
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var tempLable: UILabel!
    var weatherInfo:WeatherInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let weather = weatherInfo!.weather
        nameLabel.text = weatherInfo!.name
        weatherLabel.text = weather
        tempLable.text = String(Int(weatherInfo!.temp - 273.15)) + "°C"
        setImage(weather: weather)
    }
    
    func setImage(weather:String) {
        switch weather {
        case "Thunderstorm":
            let urlSTR = "http://openweathermap.org/img/w/11d.png"
            URLSession.shared.dataTask(with: URL(string: urlSTR)!, completionHandler: {(data, response, error) -> Void in
                guard let data = data else {return}
                DispatchQueue.main.sync {
                    self.imgView.image = UIImage(data: data)
                }
            }).resume()
        case "Drizzle":
            let urlSTR = "http://openweathermap.org/img/w/09d.png"
            URLSession.shared.dataTask(with: URL(string: urlSTR)!, completionHandler: {(data, response, error) -> Void in
                guard let data = data else {return}
                DispatchQueue.main.sync {
                    self.imgView.image = UIImage(data: data)
                }
            }).resume()
        case "Rain":
            let urlSTR = "http://openweathermap.org/img/w/10d.png"
            URLSession.shared.dataTask(with: URL(string: urlSTR)!, completionHandler: {(data, response, error) -> Void in
                guard let data = data else {return}
                DispatchQueue.main.sync {
                    self.imgView.image = UIImage(data: data)
                }
            }).resume()
        case "Snow":
            let urlSTR = "http://openweathermap.org/img/w/13d.png"
            URLSession.shared.dataTask(with: URL(string: urlSTR)!, completionHandler: {(data, response, error) -> Void in
                guard let data = data else {return}
                DispatchQueue.main.sync {
                    self.imgView.image = UIImage(data: data)
                }
            }).resume()
        case "Mist":
            let urlSTR = "http://openweathermap.org/img/w/50d.png"
            URLSession.shared.dataTask(with: URL(string: urlSTR)!, completionHandler: {(data, response, error) -> Void in
                guard let data = data else {return}
                DispatchQueue.main.sync {
                    self.imgView.image = UIImage(data: data)
                }
            }).resume()
        case "Clear":
            let urlSTR = "http://openweathermap.org/img/w/01d.png"
            URLSession.shared.dataTask(with: URL(string: urlSTR)!, completionHandler: {(data, response, error) -> Void in
                guard let data = data else {return}
                DispatchQueue.main.sync {
                    self.imgView.image = UIImage(data: data)
                }
            }).resume()
        case "Clouds":
            let urlSTR = "http://openweathermap.org/img/w/02d.png"
            URLSession.shared.dataTask(with: URL(string: urlSTR)!, completionHandler: {(data, response, error) -> Void in
                guard let data = data else {return}
                DispatchQueue.main.sync {
                    self.imgView.image = UIImage(data: data)
                }
            }).resume()
        default:
            return
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
