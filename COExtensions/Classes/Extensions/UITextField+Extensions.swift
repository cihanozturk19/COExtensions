//
//  UITextFieldExtensions.swift
//  BicaySoyle
//
//  Created by BIMSERMAC on 4.04.2018.
//  Copyright © 2018 Bicay. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    func loadDropdownData(data: [String]) {
        self.inputView = DataPickerView(pickerData: data, dropdownField: self)
    }
    
    func loadDropdownData(data: [String], onSelect selectionHandler : @escaping (_ selectedText: String) -> Void) {
        self.inputView = DataPickerView(pickerData: data, dropdownField: self, onSelect: selectionHandler)
    }
}

extension UITextField{
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            let anotherAttribute = [ NSAttributedString.Key.foregroundColor: newValue! ]

            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes: anotherAttribute)
            
        }
    }
}
