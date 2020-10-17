//
//  UIImage.swift
//  ImageFilters
//
//  Created by Александр Чаусов on 17.10.2020.
//

import UIKit

extension UIImage {

    convenience init?(color: UIColor?, size: CGSize = CGSize(width: 1, height: 1)) {
        let color = color ?? UIColor.clear
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        guard let cgImage = image?.cgImage else {
            return nil
        }
        self.init(cgImage: cgImage)
    }

}
