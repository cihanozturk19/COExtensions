//
//  UIButton+ExCustom.swift
//  Cilek B2B
//
//  Created by Yunus Kılınç on 20/07/15.
//  Copyright (c) 2015 Yunus Kılınç. All rights reserved.
//

import UIKit
import Localize_Swift

@IBDesignable
public extension UIButton {
    
    @IBInspectable var localizeText: String? {
        get {
            return self.titleLabel?.text
        }
        set {
            
            setTitle(newValue?.localized(), for: .normal)
        }
    }
    
}
