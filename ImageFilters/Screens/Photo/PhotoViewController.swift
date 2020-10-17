//
//  PhotoViewController.swift
//  ImageFilters
//
//  Created by Александр Чаусов on 17.10.2020.
//

import UIKit

class PhotoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction private func backPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

    @IBAction private func chooseFilter(_ sender: Any) {
        let navController = UINavigationController(rootViewController: FiltersViewController())
        present(navController, animated: true, completion: nil)
    }

}
