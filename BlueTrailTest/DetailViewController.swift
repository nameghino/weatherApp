//
//  DetailViewController.swift
//  BlueTrailTest
//
//  Created by Guadalupe Vlcek on 13/11/16.
//  Copyright © 2016 Vlcek Guadalupe. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var maxLabel: UILabel!
    @IBOutlet weak var minLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var cloudsLabel: UILabel!
    @IBOutlet weak var rainLabel: UILabel!
    @IBOutlet weak var morningLabel: UILabel!
    @IBOutlet weak var eveningLabel: UILabel!
    @IBOutlet weak var nightLabel: UILabel!
    
    var weatherForecast: WeatherForecast!
    
    override func viewDidLoad() {

        tempLabel.text = String(weatherForecast.temperature)
        statusLabel.text = weatherForecast.state
        dateLabel.text = weatherForecast.date
        maxLabel.text = String(weatherForecast.max)
        minLabel.text = String(weatherForecast.min)
    }
    
}