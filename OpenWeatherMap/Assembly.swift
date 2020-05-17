//
//  Assembly.swift
//  OpenWeatherMap
//
//  Created by Alevtina on 04/06/2019.
//  Copyright © 2019 Alevtina. All rights reserved.
//

import Foundation
import UIKit

class Assembly {

    let session: URLSession
    let dataLoader: DataLoader
    let storyboard: UIStoryboard

    let cityListTableViewController: CityListTableViewController

    init() {
        storyboard = UIStoryboard(name: "Main", bundle: nil)

        session = URLSession.shared
        dataLoader = WeatherDataLoader(session: session)

        guard let tableViewController = storyboard
            .instantiateViewController(withIdentifier: "cityListTableViewController") as? CityListTableViewController
            else {
                self.cityListTableViewController = CityListTableViewController()
                return
        }

        cityListTableViewController = tableViewController
        cityListTableViewController.dataLoader = dataLoader
    }
}
