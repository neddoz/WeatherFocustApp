//
//  StoryboardLoadable.swift
//  WeatherForecastApp
//
//  Created by kayeli dennis on 29/11/2018.
//  Copyright © 2018 kayeli dennis. All rights reserved.
//

import UIKit

protocol StoryboardLoadable {
    static func instantiate(from sb: AppStoryBoards) -> Self
}

extension StoryboardLoadable where Self: UIViewController {
    static func instantiate(from sb: AppStoryBoards)-> Self {
        let name = String(describing: self)
        let storyboard = UIStoryboard(name: sb.rawValue, bundle: Bundle.main)
        guard let vc = storyboard.instantiateViewController(withIdentifier: name) as? Self else {
            fatalError("Failed to instantiate view controller with identifier=\(name) from storyboard \( storyboard )")
        }
        return vc
    }
}

/// All View Controllers conform to this
extension UIViewController: StoryboardLoadable {}
