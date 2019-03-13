//
//  UICollectionView+ExCustom.swift
//  BOYSWeb
//
//  Created by BIMSERMAC on 25.10.2018.
//  Copyright © 2018 BOYSWeb. All rights reserved.
//

import Foundation
import UIKit

public extension UICollectionView{
        
    func cellWithIdentifierAndIndexPath<T:UICollectionViewCell>(cell:T.Type,indexPath:IndexPath) -> T {
        
        let genericCell = self.dequeueReusableCell(withReuseIdentifier: T.className, for: indexPath) as! T
        return genericCell
    }
}
public extension UICollectionView {
    
    func setEmptyMessage(_ message: String,font:UIFont) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = .black
        messageLabel.numberOfLines = 0;
        messageLabel.textAlignment = .center;
        messageLabel.font = font
        messageLabel.sizeToFit()
        
        self.backgroundView = messageLabel;
    }
    
    func restore() {
        self.backgroundView = nil
    }
}
