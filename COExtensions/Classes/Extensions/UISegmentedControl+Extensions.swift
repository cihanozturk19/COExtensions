//
//  Extensions.swift
//  BicaySoyle
//
//  Created by Cihan Öztürk on 29.03.2018.
//  Copyright © 2018 Bicay. All rights reserved.
//

import Foundation
import UIKit

extension UISegmentedControl {
    
    func customFont(font:UIFont? = nil){
        
        let usingFont: [AnyHashable : Any] = [NSAttributedString.Key.font : font ?? UIFont.systemFont(ofSize: 15.0)]
        self.setTitleTextAttributes(usingFont as? [NSAttributedString.Key : Any], for: .normal)
    }
    
    func removeBorders() {
        setBackgroundImage(imageWithColor(color: backgroundColor ?? .white), for: .normal, barMetrics: .default)
        setBackgroundImage(imageWithColor(color: tintColor!), for: .selected, barMetrics: .default)
        setDividerImage(imageWithColor(color: UIColor.clear), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
    }
    
    // create a 1x1 image with this color
    private func imageWithColor(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0.0, y: 0.0, width:  1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor);
        context!.fill(rect);
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image!
    }
}

