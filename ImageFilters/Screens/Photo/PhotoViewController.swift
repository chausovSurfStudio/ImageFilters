//
//  PhotoViewController.swift
//  ImageFilters
//
//  Created by Александр Чаусов on 17.10.2020.
//

import UIKit

class PhotoViewController: UIViewController {

    @IBOutlet private weak var backButton: UIButton!
    @IBOutlet private weak var chooseFilterButton: UIButton!
    @IBOutlet private weak var shareButton: UIButton!
    @IBOutlet private weak var imageView: UIImageView!

    @IBOutlet private weak var indicatorContainerView: UIView!
    @IBOutlet private weak var indicatorView: UIActivityIndicatorView!

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
        configureAppearance()
        imageView.image = originalImage
    }

    @IBAction private func backPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

    @IBAction private func chooseFilter(_ sender: Any) {
        let filterController = FiltersViewController()
        let navController = UINavigationController(rootViewController: filterController)

        filterController.onFilterSelect = { [weak self] type in
            self?.dismiss(animated: true, completion: nil)
            self?.applyFilter(type: type)
        }

        present(navController, animated: true, completion: nil)
    }

    @IBAction private func shareImage(_ sender: Any) {
        guard let image = imageView.image else {
            return
        }
        let activityVC = UIActivityViewController(activityItems: [image],
                                                  applicationActivities: nil)
        present(activityVC, animated: true, completion: nil)
    }

}

// MARK: - Private Methods

private extension PhotoViewController {

    func configureAppearance() {
        view.backgroundColor = Colors.background

        backButton.applyStyle()
        backButton.setTitle("Назад", for: .normal)

        chooseFilterButton.applyStyle()
        chooseFilterButton.setTitle("Выбрать фильтр", for: .normal)

        shareButton.tintColor = Colors.shareButton

        imageView.contentMode = .scaleAspectFit

        indicatorContainerView.backgroundColor = Colors.buttonBackground
        indicatorContainerView.layer.cornerRadius = 5
        indicatorView.color = Colors.buttonText
        stopIndicator()
    }

    func applyFilter(type: FilterType) {
        startIndicator()
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            let image = self?.originalImage.addFilter(type: type)
            DispatchQueue.main.async { [weak self] in
                self?.imageView.image = image
                self?.stopIndicator()
            }
        }
    }

    func startIndicator() {
        indicatorContainerView.isHidden = false
        indicatorView.startAnimating()
    }

    func stopIndicator() {
        indicatorContainerView.isHidden = true
        indicatorView.stopAnimating()
    }

}
