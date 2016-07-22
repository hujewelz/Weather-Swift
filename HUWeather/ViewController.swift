//
//  ViewController.swift
//  HUWeather
//
//  Created by mac on 16/7/22.
//  Copyright © 2016年 hujewelz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: UITableViewDataSource

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CityCell.ID, forIndexPath: indexPath) as! CityCell
        
        return cell
    }
    

    //MARK: prepareForSegue
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let cell = sender as! CityCell
        
        let v = segue.destinationViewController as! WeatherDetailViewController
        v.cityName = cell.cityLabel.text!
    }
}

