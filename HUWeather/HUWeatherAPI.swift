//
//  HUWeatherAPI.swift
//  HUWeather
//
//  Created by mac on 16/7/22.
//  Copyright © 2016年 hujewelz. All rights reserved.
//

import Foundation

enum Result<T> {
    case Success(T)
    case Failed(String)
}

class HUWeatherAPI: NSObject {
    
    static let BAIDU_WEATHER_URL = "http://apis.baidu.com/apistore/weatherservice/cityname"
    static let API_KEY = "45ad02d072820599ef54c04eca7833d0"
    
    typealias CompleteHandler = (Result<Weather>) -> Void
    
    class func GETCityDataWithCity(city: String, completeHandler: CompleteHandler) {
        
        guard let city =  city.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet()) else {
            return
        }
        
        let httpArg = "cityname=\(city)"
        
        let request = NSMutableURLRequest(URL: NSURL(string: BAIDU_WEATHER_URL+"?"+httpArg)!)
        request.timeoutInterval = 15
        request.HTTPMethod = "GET"
        request.addValue(API_KEY, forHTTPHeaderField: "apikey")
    
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        let task = session.dataTaskWithRequest(request) { (data, response, error) in
            
            print("error: \(error)")
            
            if error != nil {
                
                return
            }
            
            guard let json = try? NSJSONSerialization.JSONObjectWithData(data!, options: []) else {
                return;
            }
            
            //print("json:\(json)")
            if json["errMsg"] as! String != "success" {
               // Result.Failed(json["errMsg"] as! String)
                return;
            }
            
        
            dispatch_async(dispatch_get_main_queue(), { 
                completeHandler(Result.Success(Weather(json: json["retData"] as! NSDictionary)))
            })
            
            
            
        }
        
        task .resume()
        
    }

}
