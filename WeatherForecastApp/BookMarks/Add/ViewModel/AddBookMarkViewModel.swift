//
//  AddBookMarkViewModel.swift
//  WeatherForecastApp
//
//  Created by kayeli dennis on 29/11/2018.
//  Copyright © 2018 kayeli dennis. All rights reserved.
//

import Foundation

struct AddBookMarkViewModel {

   public private(set) var place: Place

    init(place: Place) {
        self.place = place
    }
}
