//
//  MainViewController.swift
//  ImageFilters
//
//  Created by Александр Чаусов on 17.10.2020.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet private weak var startButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    @IBAction private func choosePhoto(_ sender: Any) {
        let vc = PhotoViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

}

// MARK: - Private Methods

private extension MainViewController {

    func configureAppearance() {
        navigationController?.setNavigationBarHidden(true, animated: false)
        view.backgroundColor = Colors.background
        startButton.setTitleColor(Colors.buttonText, for: .normal)
        startButton.setTitle("Выбрать фото", for: .normal)
    }

}
