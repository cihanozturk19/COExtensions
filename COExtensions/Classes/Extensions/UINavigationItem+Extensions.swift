//
//  UINavigationItemExtensions.swift
//  BicaySoyle
//
//  Created by BIMSERMAC on 6.04.2018.
//  Copyright © 2018 Bicay. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationItem{
    
    @available(iOS 9.0, *)
    fileprivate func customBarButtonItem(_ width: CGFloat, _ height: CGFloat, _ icon: String, _ target: UIViewController, _ action: Selector)->UIBarButtonItem {
        let buttonCustom = UIButton(frame: CGRect(x: 0, y: 0, width: width, height: height))
        buttonCustom.widthAnchor.constraint(equalToConstant: width).isActive = true
        buttonCustom.heightAnchor.constraint(equalToConstant: height).isActive = true
        buttonCustom.setImage(UIImage(named: icon), for: .normal)
        buttonCustom.addTarget(target, action: action, for: .touchUpInside)
        
        return UIBarButtonItem(customView: buttonCustom)
    }
    
    @available(iOS 9.0, *)
    func customLeftNavBarItem(_ icon: String, width:CGFloat, height:CGFloat, target: UIViewController, action: Selector){
        
        self.leftBarButtonItem = customBarButtonItem(width, height, icon, target, action)
    }
    
    @available(iOS 9.0, *)
    func customRightNavBarItem(_ icon: String, width:CGFloat, height:CGFloat, target: UIViewController, action: Selector){
        
        self.rightBarButtonItem = customBarButtonItem(width, height, icon, target, action)
    }
    
    func isEnabledRightBarButton(isEnabled:Bool){
        self.rightBarButtonItem?.isEnabled = isEnabled
    }
    
    func isEnabledLeftBarButton(isEnabled:Bool){
        self.leftBarButtonItem?.isEnabled = isEnabled
    }
    
    func logoTitleView(isHidden:Bool? = true){
        
//        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 105, height: 35))
//        imageView.contentMode = .scaleAspectFit
//        imageView.image = #imageLiteral(resourceName: "logo_nav_bar")
//        imageView.backgroundColor = UIColor.green
//        self.titleView = imageView
        
        let imageView = UIImageView(image: UIImage(named: "logo_nav_bar"))
        imageView.contentMode = UIView.ContentMode.scaleAspectFill
        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: 105, height: 35))
        imageView.frame = titleView.bounds
        titleView.addSubview(imageView)
        self.titleView = titleView
    }
    func customTitleView(_ icon: String, width:CGFloat, height:CGFloat){
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named:icon)
        self.titleView = imageView
    }
}

//extension UINavigationBar {
//    open override func sizeThatFits(_ size: CGSize) -> CGSize {
//        
//        let portraitSize = CGSize(width: UIScreen.main.bounds.width, height: 44)
//        return portraitSize
//    }
//}
