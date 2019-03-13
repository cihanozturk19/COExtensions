//
//  UIViewControllerExtensions.swift
//  BicaySoyle
//
//  Created by Cihan Öztürk on 8.04.2018.
//  Copyright © 2018 Bicay. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
    
   open func isNavigationBarHidden(isHidden:Bool){
        self.navigationController?.setNavigationBarHidden(isHidden, animated: false)
    }
}
extension UIViewController {
    public static func instantiateFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>(_ viewType: T.Type) -> T {
            return T.init(nibName: T.className, bundle: nil)
            //String(describing: T.self) = T.className
        }
        
        return instantiateFromNib(self)
    }
    
    public static func instantiateFromLoginStoryBoard() -> Self {
        
        func instantiateFromLoginStoryBoard<T:UIViewController>(_ viewType: T.Type) -> T {
            
            return UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: T.className) as! T
        }
        return instantiateFromLoginStoryBoard(self)
    }
    
    public static func instantiateFromMainStoryBoard() -> Self {
        
        func instantiateFromMainStoryBoard<T:UIViewController>(_ viewType: T.Type) -> T {
            
            return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: T.className) as! T
        }
        return instantiateFromMainStoryBoard(self)
    }
    
    public static func instantiateFromDashboardStoryBoard() -> Self {
        
        func instantiateFromDashboardStoryBoard<T:UIViewController>(_ viewType: T.Type) -> T {
            return UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: T.className) as! T
        }
        return instantiateFromDashboardStoryBoard(self)
    }
    
    public static func instantiateFromAuthenticationStoryBoard() -> Self {
        
        func instantiateFromAuthenticationStoryBoard<T:UIViewController>(_ viewType: T.Type) -> T {
            
            return UIStoryboard(name: "Authentication", bundle: nil).instantiateViewController(withIdentifier: T.className) as! T
        }
        return instantiateFromAuthenticationStoryBoard(self)
    }
    
    public static func instantiateFromTemplatesStoryBoard() -> Self {
        
        func instantiateFromTemplatesStoryBoard<T:UIViewController>(_ viewType: T.Type) -> T {
            
            return UIStoryboard(name: "Templates", bundle: nil).instantiateViewController(withIdentifier: T.className) as! T
        }
        return instantiateFromTemplatesStoryBoard(self)
    }
    
    public static func instantiateFromPopupStoryBoard() -> Self {
        
        func instantiateFromPopupStoryBoard<T:UIViewController>(_ viewType: T.Type) -> T {
            
            return UIStoryboard(name: "Popup", bundle: nil).instantiateViewController(withIdentifier: T.className) as! T
        }
        return instantiateFromPopupStoryBoard(self)
    }
    
    public static func instantiateFromTabBarStoryBoard() -> Self {
        
        func instantiateFromTabBarStoryBoard<T:UIViewController>(_ viewType: T.Type) -> T {
            
            return UIStoryboard(name: "Tab", bundle: nil).instantiateViewController(withIdentifier: T.className) as! T
        }
        return instantiateFromTabBarStoryBoard(self)
    }
    
    public static func instantiateFromStoryBoard(_ storyBoardName:String) -> Self {
        
        func instantiateFromStoryBoard<T:UIViewController>(_ viewType: T.Type) -> T {
            
            return UIStoryboard(name: storyBoardName, bundle: nil).instantiateViewController(withIdentifier: T.className) as! T
        }
        return instantiateFromStoryBoard(self)
    }
    
}
