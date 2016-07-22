//
//  HUWeatherDetailViewController.swift
//  HUWeather
//
//  Created by mac on 16/7/22.
//  Copyright © 2016年 hujewelz. All rights reserved.
//

import UIKit

class WeatherDetailViewController: UIViewController {
    
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var tmpLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var cityName: String = "北京" {
        willSet {
            print(newValue)
            HUWeatherAPI.GETCityDataWithCity(newValue) { [weak self] result in
             
                switch result {
                case .Success(let w):
                    //print("weather: \(w)")
                    self!.cityLabel.text = w.city
                    self!.tmpLabel.text = w.temp
                case .Failed(let msg):
                    print("errMsg: \(msg)")
                }
            }
            
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
