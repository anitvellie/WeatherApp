//
//  ViewController.swift
//  OpenWeatherMap
//
//  Created by Alevtina on 09/05/2019.
//  Copyright © 2019 Alevtina. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let session = URLSession.shared
    let apiKey = "0295bb22612e4778084352c2e53a8230"
    let urlString = "https://samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=)"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = URL(string: "\(urlString)\(apiKey)") {
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print("Error: \(error!)")
                    return
                }
                guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                    print("Server error occured.)")
                    return
                }
                guard let mime = response?.mimeType, mime == "application/json" else {
                    print("Wrong mime type.")
                    return
                }
                if let jsonData = data {
                    do {
                        let weather = try JSONDecoder().decode(Weather.self, from: jsonData)
                        print(weather)
                    } catch let error {
                        print("Error occured while JSON decoding: \(error)\n\(error.localizedDescription)")
                    }
                }
            }
            task.resume()
        }
    }
}
