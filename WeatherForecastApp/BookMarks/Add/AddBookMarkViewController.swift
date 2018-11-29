//
//  AddBookMarkViewController.swift
//  WeatherForecastApp
//
//  Created by kayeli dennis on 29/11/2018.
//  Copyright © 2018 kayeli dennis. All rights reserved.
//

import UIKit

class AddBookMarkViewController: UIViewController {

    @IBOutlet var descriptionOutlet: UITextView!

    var viewModel: AddBookMarkViewModel? {
        didSet {
            configureView()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func configureView() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(save))
        guard let vm = viewModel else {return}
        navigationItem.title = vm.place.title
    }
    
    @objc private func save() {
        guard let vm = viewModel else {return}
        vm.place.additionalInfo = descriptionOutlet.text
        let userDefaults = UserDefaults.standard
        if let decoded = userDefaults.object(forKey: "cities") as? Data,
            var decodedList = NSKeyedUnarchiver.unarchiveObject(with: decoded) as? [Place] {
            decodedList.append(vm.place)
            userDefaults.removeObject(forKey: "cities")
            let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: decodedList)
            userDefaults.set(encodedData, forKey: "cities")
            userDefaults.synchronize()
        } else {
            let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: vm.place)
            userDefaults.set(encodedData, forKey: "cities")
            userDefaults.synchronize()
        }
        navigationController?.popViewController(animated: true)
    }
}
