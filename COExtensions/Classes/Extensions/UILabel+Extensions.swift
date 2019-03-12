//
//  UILabel+ExCustom.swift
//  Cilek B2B
//
//  Created by Yunus Kılınç on 20/07/15.
//  Copyright (c) 2015 Yunus Kılınç. All rights reserved.
//

import UIKit
import Localize_Swift

@IBDesignable
public extension UILabel {
    
    @IBInspectable var localizeText: String? {
        get {
            return self.text
        }
        set {
            
            self.text = newValue?.localized()
        }
    }
    
    func setStrokeLabelText(_ text:String) {
        
        let mAttrString = NSMutableAttributedString(string: text)
        mAttrString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0, mAttrString.length))
      
        
        self.attributedText = mAttrString
        
    }
    
    
}
