//
//  WeatherForeCastViewModel.swift
//  WeatherForecastApp
//
//  Created by kayeli dennis on 29/11/2018.
//  Copyright © 2018 kayeli dennis. All rights reserved.
//

import Foundation

struct WeatherForeCastViewModel {

    var item: WeatherItem

    init(with item: WeatherItem) {
        self.item = item
    }
}

extension WeatherForeCastViewModel {
    
    func numberOfSections()-> Int {
        return 1
    }
    
    func numberOfRows(for section: Int)-> Int {
        return 1
    }
    
    func content(for row: Int)-> String {
        let desiredItem = item
        return "Temperature: \(desiredItem.main.temp), MiniMumTemperature: \(desiredItem.main.tempMin), humidity: \(desiredItem.main.humidity), Visibility: \(desiredItem.visibility)"
    }
    
    func title(for section: Int)-> String {
        return item.name
    }
}

