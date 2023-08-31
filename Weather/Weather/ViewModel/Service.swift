//
//  Service.swift
//  Weather
//
//  Created by Демьян Горчаков on 31.08.2023.
//

import Foundation

class Service {
    static let shared = Service()
    
    let urlString = "https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.44&past_days-10&hourly=temperature_2m"
    
    func getCurrentWeather(completion: @escaping ([Double]) -> Void) {
        let url = URL(string: urlString)!
        var request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data else { return }
            if let weatherData = try? JSONDecoder().decode(WeatherData.self, from: data) {
                completion(weatherData.hourly.temperature2M)
            } else {
                print("fail")
            }
        }
        task.resume()
    }
}
