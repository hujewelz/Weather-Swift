//
//  Weather.swift
//  HUWeather
//
//  Created by mac on 16/7/22.
//  Copyright © 2016年 hujewelz. All rights reserved.
//

import Foundation

struct Weather {
    
    var city: String?
    var date: String?
    var h_tmp: String? //最高温度
    var l_tmp: String? //最低温度
    var sunrise: String? //日出时间
    var sunset: String? //日落时间
    var temp: String? //气温
    var weather: String? //天气
    var wd: String? //风向
    var ws: String? //风力
    
 
    init(json: NSDictionary) {
        
        let city = json["city"] as? String
        let date = json["date"] as? String
        let h_tmp = json["h_tmp"] as? String
        let l_tmp = json["l_tmp"] as? String
        let sunrise = json["sunrise"] as? String
        let sunset = json["sunset"] as? String
        let temp = json["temp"] as? String
        let weather = json["weather"] as? String
        let wd = json["WD"] as? String
        let ws = json["WS"] as? String
        
        self.city = city
        self.date = date
        self.weather = weather
        self.h_tmp = h_tmp
        self.l_tmp = l_tmp
        self.sunrise = sunrise
        self.sunset = sunset
        self.temp = temp
        self.wd = wd
        self.ws = ws

    }
}