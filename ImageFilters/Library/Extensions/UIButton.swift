//
//  UIButton.swift
//  ImageFilters
//
//  Created by Александр Чаусов on 17.10.2020.
//

import UIKit

extension UIButton {

    func applyStyle() {
        self.setTitleColor(Colors.buttonText, for: .normal)
        self.setBackgroundImage(UIImage(color: Colors.buttonBackground), for: .normal)
        self.contentEdgeInsets = .init(top: 10, left: 16, bottom: 10, right: 16)
    }

}
