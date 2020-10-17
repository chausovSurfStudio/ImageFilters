//
//  MainViewController.swift
//  ImageFilters
//
//  Created by Александр Чаусов on 17.10.2020.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    @IBAction private func choosePhoto(_ sender: Any) {
        let vc = PhotoViewController()
        navigationController?.pushViewController(vc, animated: true)
    }


}
