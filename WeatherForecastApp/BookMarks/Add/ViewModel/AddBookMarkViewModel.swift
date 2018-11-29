//
//  AddBookMarkViewModel.swift
//  WeatherForecastApp
//
//  Created by kayeli dennis on 29/11/2018.
//  Copyright © 2018 kayeli dennis. All rights reserved.
//

import Foundation

struct AddBookMarkViewModel {

   public var place: Place

    init(place: Place) {
        self.place = place
    }
    
    func commit() {
        let userDefaults = UserDefaults.standard
        if let decoded = userDefaults.object(forKey: "cities") as? Data,
            var decodedList = NSKeyedUnarchiver.unarchiveObject(with: decoded) as? [Place] {
            decodedList.append(self.place)
            let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: decodedList)
            userDefaults.set(encodedData, forKey: "cities")
            userDefaults.synchronize()
        } else {
            let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: [self.place])
            userDefaults.set(encodedData, forKey: "cities")
            userDefaults.synchronize()
        }
    }
}
