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
        vm.commit()
        navigationController?.popViewController(animated: true)
    }
}
