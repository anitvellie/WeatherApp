//
//  CityListTableViewController.swift
//  OpenWeatherMap
//
//  Created by Alevtina on 16/05/2019.
//  Copyright © 2019 Alevtina. All rights reserved.
//

import UIKit

class CityListTableViewController: UITableViewController {
    
    let listOfCityNames = ["Kaliningrad", "Moscow", "London", "Paris", "Warsaw", "Brighton", "Barcelona", "Dublin", "Berlin"]
    var weathers = [Weather]()

    
    var dataLoader: IDataLoader = DataLoader()

    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        dataLoader = DataLoader()
        listOfCityNames.forEach {
            dataLoader.getWeather(for: $0, completion: { [weak self] weather in
                if let weatherForCity = weather {
                    self?.weathers.append(weatherForCity)
                    DispatchQueue.main.async {
                        self?.tableView.reloadData()
                    }
                }
            })
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weathers.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath) as? CityTableViewCell {
            cell.cityLabel.text = weathers[indexPath.row].city
            cell.degreeLabel.text = "\(weathers[indexPath.row].mainParameter.getTemperatureCelsius())º"
            dataLoader.getIcon(for: weathers[indexPath.row]) { image in
                DispatchQueue.main.async {
                    cell.weatherIcon.image = image
                }
            }
            let fontMetrics = UIFontMetrics(forTextStyle: .body)
            
            let cityFont = UIFont.systemFont(ofSize: CityTableViewCell.SizeRatio.cityFontSize, weight: .light)
            cell.cityLabel.font = fontMetrics.scaledFont(for: cityFont)
            
            let degreeFont = UIFont.systemFont(ofSize: CityTableViewCell.SizeRatio.degreeFontSize, weight: .light)
            cell.degreeLabel.font = fontMetrics.scaledFont(for: degreeFont)
            
            return cell
        } else {
            return UITableViewCell()
        }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
