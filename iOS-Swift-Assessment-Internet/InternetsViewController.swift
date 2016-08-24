//
//  InternetViewController.swift
//  iOS-Week8-Swift-Assessment
//
//  Created by Flatiron School on 7/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class InternetsViewController: UIViewController {

    @IBOutlet weak var weatherLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func updateWeatherTouched(sender: UIButton) {
       self.fetchWeather()
    }
    

    func fetchWeather(){
        
        //let urlString = "https://flatironAssessment.week8.com/weatherInfo"
        let urlString = "https://swift-internet-week8.herokuapp.com/"
        
        TemperatureAPIClient.getTemperaturesWithCompletion(urlString) { (responseDictionary) in
            if let temperatureDictionary = responseDictionary["temperature"] {
                guard let celsius = temperatureDictionary["celsius"] as! Int? else {
                    print("not able to unwrap celsius")
                    return
                }
                guard let fahrenheit = temperatureDictionary["fahrenheit"] as! Int? else {
                    print("not able to unwrap fahrenheit")
                    return
                }
                let temperatureString = "\(celsius)C / \(fahrenheit)F"
                self.weatherLabel.text = temperatureString
            }
            else {
                print("could not get the temperature values")
            }
        }
    }
}
