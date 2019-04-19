//
//  UICollectionViewCell + Extensions.swift
//  Pods
//
//  Created by BIMSERMAC on 19.04.2019.
//

import Foundation
import UIKit

extension UICollectionViewCell{
    
    func addSpinner(_ color:UIColor? = nil){
        
        Spinner.shared.color = color ?? UIColor.gray
        Spinner.shared.startAnimating()
        Spinner.shared.center = self.contentView.center
        self.contentView.addSubview(Spinner.shared)
    }
    func removeSpinner(){
        Spinner.shared.stopAnimating()
        Spinner.shared.removeFromSuperview()
    }
    
    func cornerRadius(_ radius:CGFloat? = nil, borderWidth:CGFloat? = nil){
        
        contentView.layer.cornerRadius = radius ?? 15
        contentView.layer.borderWidth = borderWidth ?? 1.0
        contentView.layer.borderColor = UIColor.clear.cgColor
        contentView.layer.masksToBounds = true
    }
    
    
}
