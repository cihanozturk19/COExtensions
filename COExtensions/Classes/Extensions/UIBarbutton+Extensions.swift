//
//  UIBarbutton+ExCustom.swift
//  BOYSWeb
//
//  Created by BIMSERMAC on 21/04/16.
//  Copyright © 2016 BOYSWeb. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
public extension UIBarButtonItem {
    
    @IBInspectable var localizeText: String? {
        get {
            return self.title
        }
        set {
            //self.setpo(newValue?.localized(), forState: .Normal)
            //setTitle(newValue?.localized(), forState: .Normal)
        }
    }
    
}
extension UIBarButtonItem{
    
    func getCustomUIBarButtonItem(_ icon: String, width:CGFloat, height:CGFloat, target: UIViewController, action: Selector) -> UIBarButtonItem {
        
        let buttonCustom = UIButton(frame: CGRect(x: 0, y: 0, width: width, height: height))
        buttonCustom.setImage(UIImage(named: icon), for: UIControl.State())
        buttonCustom.addTarget(target, action: action, for: .touchUpInside)
        let barButtonItem = UIBarButtonItem(customView: buttonCustom)
        return barButtonItem
        
    }
}
