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

    func addFilter(type: FilterType) -> UIImage? {
        guard type != .original else {
            return self
        }
        guard let filter = CIFilter(name: type.rawValue) else {
            return nil
        }
        let ciInput = CIImage(image: self)
        filter.setValue(ciInput, forKey: "inputImage")

        let ciContext = CIContext()
        guard
            let ciOutput = filter.outputImage,
            let cgImage = ciContext.createCGImage(ciOutput, from: ciOutput.extent)
        else {
            return nil
        }
        return UIImage(cgImage: cgImage)
    }

}
