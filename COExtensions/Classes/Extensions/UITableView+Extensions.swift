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
    
    func cellWithIdentifierNoneSelection<T:UITableViewCell>(cell:T.Type) -> T {
        
        let genericCell = self.dequeueReusableCell(withIdentifier: T.className) as! T
        genericCell.selectionStyle = .none
        return genericCell
    }
    
    func cellWithIdentifierAndIndexPath<T:UITableViewCell>(cell:T.Type,indexPath:IndexPath) -> T {
        
        let genericCell = self.dequeueReusableCell(withIdentifier: T.className, for: indexPath) as! T
        return genericCell
    }
      
}
public extension UITableView{
    
    func addSpinner(_ color:UIColor? = nil){
        
        Spinner.shared.color = color ?? UIColor.gray
        Spinner.shared.startAnimating()
        self.backgroundView = Spinner.shared
    }
    func removeSpinner(){
        Spinner.shared.stopAnimating()
        self.backgroundView = nil
    }
}
public extension UITableView{
    
    func getIndexPathFromTableView(_ view:UIView)->IndexPath{
    
        let point = self.convert(CGPoint.zero, from: view)
    
        guard let indexPath = self.indexPathForRow(at: point) else {
            fatalError("can't find point in tableView")
        }
    
        return indexPath
    }
}
public extension UITableView{
    
    func tableHeaderView<T:UIView>(view:T.Type, _ width:CGFloat, _ radius:CGFloat? = 20, _ headerText:String, _ headerTextColor:String? = "333D47",_ headerTextFont:String? = "SourceSansPro-Bold", _ bgColorHex:String){
        
        let header = Bundle.main.loadNibNamed("\(view.self)", owner: nil, options: nil)!.first as! UIView
        header.roundCorners(corners: [.topLeft, .topRight], radius: radius!,width: width)
        header.backgroundColor = UIColor(hexString: bgColorHex)

        let headerLabel = UILabel(frame: CGRect(x: 20, y: 0, width: header.frame.width - 40, height: header.frame.height))
        headerLabel.font = UIFont(name: headerTextFont!, size: 18)
        headerLabel.textColor = UIColor(hexString: headerTextColor!)
        headerLabel.text = headerText
        header.addSubview(headerLabel)
        self.tableHeaderView = header
    }
    
    func tableFooterView<T:UIView>(view:T.Type, _ width:CGFloat, _ radius:CGFloat? = 20, _ headerText:String, _ headerTextColor:String? = "333D47",_ headerTextFont:String? = "SourceSansPro-Bold", _ bgColorHex:String){
        
        let header = Bundle.main.loadNibNamed("\(view.self)", owner: nil, options: nil)!.first as! UIView
        header.roundCorners(corners: [.bottomLeft, .bottomRight], radius: radius!,width: width)
        header.backgroundColor = UIColor(hexString: bgColorHex)

        let headerLabel = UILabel(frame: CGRect(x: 20, y: 0, width: header.frame.width - 40, height: header.frame.height))
        headerLabel.font = UIFont(name: headerTextFont!, size: 18)
        headerLabel.textColor = UIColor(hexString: headerTextColor!)
        headerLabel.text = headerText
        header.addSubview(headerLabel)
        self.tableHeaderView = header
    }
}
