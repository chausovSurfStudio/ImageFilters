//
//  FiltersViewController.swift
//  ImageFilters
//
//  Created by Александр Чаусов on 17.10.2020.
//

import UIKit

class FiltersViewController: UIViewController {

    private enum Constants {
        static let identifier = "defaultCell"
    }

    @IBOutlet private weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
    }

}

// MARK: - UITableViewDataSource

extension FiltersViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.identifier) else {
            return UITableViewCell()
        }
        cell.textLabel?.text = "asd"
        return cell
    }

}

// MARK: - UITableViewDelegate

extension FiltersViewController: UITableViewDelegate {

}

// MARK: - Private Methods

private extension FiltersViewController {

    func configureAppearance() {
        navigationItem.title = "Фильтры"
        tableView.separatorInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.identifier)
    }

}
