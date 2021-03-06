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

    @IBAction private func choosePhoto(_ sender: Any) {
        let pickerVC = UIImagePickerController()
        pickerVC.delegate = self
        pickerVC.sourceType = .photoLibrary
        present(pickerVC, animated: true, completion: nil)
    }

}

// MARK: - UIImagePickerControllerDelegate

extension MainViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard
            let image = info[.originalImage] as? UIImage,
            let normalizedImage = image.fixOrientation()
        else {
            return
        }
        let vc = PhotoViewController(image: normalizedImage)
        navigationController?.pushViewController(vc, animated: true)
    }

}

// MARK: - Private Methods

private extension MainViewController {

    func configureAppearance() {
        navigationController?.setNavigationBarHidden(true, animated: false)
        view.backgroundColor = Colors.background
        startButton.applyStyle()
        startButton.setTitle("Выбрать фото", for: .normal)
    }

}
