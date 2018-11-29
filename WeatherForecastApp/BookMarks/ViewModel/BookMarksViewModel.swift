//
//  BookMarksViewModel.swift
//  WeatherForecastApp
//
//  Created by kayeli dennis on 29/11/2018.
//  Copyright © 2018 kayeli dennis. All rights reserved.
//

import Foundation

class BookMarksViewModel {
    
    var places: [Place]
    
    init() {
        let userDefaults = UserDefaults.standard
        if let decoded = userDefaults.object(forKey: "cities") as? Data,
            let decodedList = NSKeyedUnarchiver.unarchiveObject(with: decoded) as? [Place] {
            self.places = decodedList
        } else {
            self.places = []
        }
    }
}

extension BookMarksViewModel {

    func numberOfSections()-> Int {
        return 1
    }

    func numberOfRows()-> Int {
        return places.count
    }

    func place(for row: Int)-> Place? {
        guard places.count >= 1 else {return nil}
        print(places[row].additionalInfo)
        return places[row]
    }
}
