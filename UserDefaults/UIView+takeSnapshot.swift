//
//  UIView+takeSnapshot.swift
//  UserDefaults
//
//  Created by IrvinTehDo on 2/26/18.
//  Copyright © 2018 Paul Solt. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    func takeSnapshot() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)
        self.drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
