//
//  UINavigationBar+Extensions.swift
//  Pods
//
//  Created by BIMSERMAC on 13.05.2019.
//

import Foundation
import UIKit

public extension UINavigationBar{
    
    func addTitleView(_ width:CGFloat, _ imgName:String){
        
        let img = UIImage(named: imgName)
        let resizeImg = img?.resizeImage(image: img!, newWidth: width)
        self.topItem?.titleView = UIImageView(image:resizeImg)
    }
}
