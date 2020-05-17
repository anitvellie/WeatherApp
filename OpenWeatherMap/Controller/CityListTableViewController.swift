//
//  CityListTableViewController.swift
//  OpenWeatherMap
//
//  Created by Alevtina on 16/05/2019.
//  Copyright © 2019 Alevtina. All rights reserved.
//

import UIKit

class CityListTableViewController: UITableViewController {

    private let listOfCityNames = ["Kaliningrad",
                                   "Moscow",
                                   "London",
                                   "Paris",
                                   "Warsaw",
                                   "Brighton",
                                   "Barcelona",
                                   "Dublin",
                                   "Berlin"]
    private var weathers = [Weather]()

    var dataLoader: DataLoader?

    override func viewDidLoad() {
        super.viewDidLoad()

        listOfCityNames.forEach {
            dataLoader?.getWeather(for: $0, completion: { [weak self] weather in
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

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weathers.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath) as? CityTableViewCell {
            cell.cityLabel.text = weathers[indexPath.row].city
            cell.degreeLabel.text = "\(weathers[indexPath.row].mainParameter.getTemperatureCelsius())º"
            dataLoader?.getIcon(for: weathers[indexPath.row]) { image in
                DispatchQueue.main.async {
                    cell.weatherIcon.image = image
                }
            }
            return cell
        } else {
            return UITableViewCell()
        }
    }
}
