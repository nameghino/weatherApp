//
//  WeatherData.swift
//  BlueTrailTest
//
//  Created by Guadalupe Vlcek on 27/10/16.
//  Copyright © 2016 Vlcek Guadalupe. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class weatherForecast {
    let temperature: Double
    let min: Double
    let max: Double
    let state: String
    
    init(temperature: Double, min: Double, max: Double, state: String) {
        self.temperature = temperature
        self.min         = min
        self.max         = max
        self.state       = state
    }
}

class obtainForecast {

var days = [weatherForecast]()
    
    func callAlamo(url: String){
        Alamofire.request(url).responseJSON(completionHandler: {
            response in
            self.parseData(JSONData: response.data!)
        })
    }
    
    func parseData(JSONData: Data) {
        do {
            let redeableJSON = try JSONSerialization.jsonObject(with: JSONData, options: .mutableContainers) as! [String : AnyObject]
            
            if let list = redeableJSON["list"] {
                
                for i in 0..<list.count {
                    let item = list[i] as! [String : AnyObject]
                    
                    let temp = item["temp"]

                    let day = temp?["day"]
                    let min = temp?["min"]
                    let max = temp?["max"]
                    
                    if let weathers = item["weather"] {
                        let weather = weathers[0] as! [String : AnyObject]
                        let description = weather["description"]
                    
                        //print("Temperature: \(day!!) | Min: \(min!!) | Max: \(max!!) | Description: \(description!)")
                        
                        let w = weatherForecast(temperature: day!! as! Double, min: min!! as! Double, max: max!! as! Double, state: description! as! String)
                        
                        days.append(w)
                    }
                }
            }
        }
        catch{
            print(error)
        }
        
        for i in 0..<days.count {
            print(days[i].state)
        }
    }
    
    
    
}
