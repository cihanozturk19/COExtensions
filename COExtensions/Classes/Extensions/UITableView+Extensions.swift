//
//  UITableView+ExCustom.swift
//  Cilek B2B
//
//  Created by Yunus Kılınç on 20/08/15.
//  Copyright (c) 2015 Yunus Kılınç. All rights reserved.
//

import UIKit

public extension UITableView {
   
    @IBInspectable var hiddenEmptySeparator: Bool {
        get {
            return false
        }
        set {
            if newValue {
                let emptyView = UIView(frame: CGRect.zero)
                emptyView.backgroundColor = UIColor.clear
                self.tableFooterView = emptyView
                self.tableFooterView?.isHidden = true
            }
        }
    }
    
    func scrollToFirstRow(){
        let indexPath = IndexPath(row: 0, section: 0)
        self.scrollToRow(at: indexPath, at: .top, animated: true)
    }
    func scrollToIndexPath(_ row:Int,section:Int){
        let indexPath = IndexPath(row: row, section: section)
        self.scrollToRow(at: indexPath, at: .top, animated: true)
    }
    
}
public extension UITableView{
    
    func registerCell<T:UITableViewCell>(cell:T.Type){
        
        self.register(T.classForCoder(), forCellReuseIdentifier: T.className)
        self.register(UINib(nibName: T.className, bundle: nil), forCellReuseIdentifier: T.className)
    }
    
    func cellWithIdentifier<T:UITableViewCell>(cell:T.Type) -> T {
        
        let genericCell = self.dequeueReusableCell(withIdentifier: T.className) as! T
        return genericCell
    }
    
    func cellWithIdentifierAndIndexPath<T:UITableViewCell>(cell:T.Type,indexPath:IndexPath) -> T {
        
        let genericCell = self.dequeueReusableCell(withIdentifier: T.className, for: indexPath) as! T
        return genericCell
    }
      
}
