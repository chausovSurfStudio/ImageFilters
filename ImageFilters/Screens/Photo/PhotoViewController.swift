//
//  PhotoViewController.swift
//  ImageFilters
//
//  Created by Александр Чаусов on 17.10.2020.
//

import UIKit

class PhotoViewController: UIViewController {

    private let originalImage: UIImage

    init(image: UIImage) {
        self.originalImage = image
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction private func backPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

    @IBAction private func chooseFilter(_ sender: Any) {
        let navController = UINavigationController(rootViewController: FiltersViewController())
        present(navController, animated: true, completion: nil)
    }

}
