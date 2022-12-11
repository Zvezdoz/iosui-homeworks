//
//  UIImageExtensions.swift
//  Navigation
//
//  Created by Maria Gorozhanova on 11.12.2022.
//

import Foundation
import UIKit

extension UIImage {
    func withAlpha(_ alpha: CGFloat) -> UIImage {
        return UIGraphicsImageRenderer(size: size, format: imageRendererFormat).image { _ in
            draw(in: CGRect(origin: .zero, size: size), blendMode: .normal, alpha: alpha)
        }
    }
}
