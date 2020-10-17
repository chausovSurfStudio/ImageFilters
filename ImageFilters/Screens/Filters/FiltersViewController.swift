//
//  FiltersViewController.swift
//  ImageFilters
//
//  Created by Александр Чаусов on 17.10.2020.
//

import UIKit

class FiltersViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Фильтры"
    }


    @IBAction private func applyFilter(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}
