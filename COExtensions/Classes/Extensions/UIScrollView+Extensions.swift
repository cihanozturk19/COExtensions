//
//  UIScrollView + Extensions.swift
//  COExtensions
//
//  Created by BIMSERMAC on 15.03.2019.
//

import Foundation
import UIKit

extension UIScrollView{
    
    func addPullRefresh(target:UIViewController,action:Selector){
        
        let refresh = UIRefreshControl()
        refresh.addTarget(target, action: action, for: UIControl.Event.valueChanged)
        refresh.backgroundColor = UIColor.clear
        if #available(iOS 10.0, *) {
            self.refreshControl = refresh
        } else {
            self.addSubview(refresh)
        }
    }
    
}
