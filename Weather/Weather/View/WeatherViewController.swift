//
//  ViewController.swift
//  Weather
//
//  Created by Демьян Горчаков on 27.08.2023.
//

import UIKit

class WeatherViewController: UIViewController {
    
    var temperatureData: [Double] =  []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        setViews()
        setConstraints()
        setLabel()
        Service.shared.getCurrentWeather { [weak self] values in
            DispatchQueue.main.async {
                self?.temperatureData = values
            }
        }
    }
    
    let weatherImage: UIImageView =  {
      let image = UIImageView()
        image.image = UIImage(named: "Weather")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    var weatherLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setLabel() {
        weatherLabel.text = "\(temperatureData)"
    }
    
    func setViews() {
        view.addSubview(weatherImage)
        view.addSubview(weatherLabel)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            weatherImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 100),
            weatherImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            weatherImage.widthAnchor.constraint(equalToConstant: 200),
            weatherImage.heightAnchor.constraint(equalToConstant: 200)
        ])
        NSLayoutConstraint.activate([
            weatherLabel.topAnchor.constraint(equalTo: weatherImage.bottomAnchor,constant: 50),
            weatherLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

}

