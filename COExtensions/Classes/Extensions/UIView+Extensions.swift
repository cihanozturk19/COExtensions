//
//  UIView+ExCustom.swift
//  Cilek B2B
//
//  Created by Yunus Kılınç on 20/07/15.
//  Copyright (c) 2015 Yunus Kılınç. All rights reserved.
//

import UIKit

@IBDesignable class StyleUILabel: UILabel {
    
    @IBInspectable var uniqueKey:String?=nil{
        didSet{
            self.uniqueID = uniqueKey
        }
    }
}
@IBDesignable
public extension UIView {
   
    //MARK: @IBInspectable
 
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var bottomBorder: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return nil
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    @IBInspectable var leftCornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            let rectShape = CAShapeLayer()
            rectShape.bounds = self.frame
            rectShape.position = self.center
            rectShape.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.bottomLeft, .topLeft], cornerRadii: CGSize(width: newValue, height: newValue)).cgPath
            
            self.layer.mask = rectShape
        }
    }
    
    @IBInspectable var rightCornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            let rectShape = CAShapeLayer()
            rectShape.bounds = self.frame
            rectShape.position = self.center
            rectShape.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.bottomRight, .topRight], cornerRadii: CGSize(width: newValue, height: newValue)).cgPath
            
            self.layer.mask = rectShape
        }
    }
    
    //MARK: Custom Func
    
    func screenShot() -> UIImage {
        
        UIGraphicsBeginImageContext(self.frame.size)
        self.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
        
    }
    func addShadowView(_ width:CGFloat=0.2, height:CGFloat=0.2, Opacidade:Float=0.7, maskToBounds:Bool=false, radius:CGFloat=0.5){
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: width, height: height)
        self.layer.shadowRadius = radius
        self.layer.shadowOpacity = Opacidade
        self.layer.masksToBounds = maskToBounds
    }
    
    
    
}

extension UIView{
    
    fileprivate struct SwiftlyFuncCustomProperties{
        static var uniqueID:String? = nil
    }
    
    var uniqueID:String?{
        
        get {
            return objc_getAssociatedObject(self,&SwiftlyFuncCustomProperties.uniqueID) as? String
        }
        set{
            if let unwrappedValue = newValue{
                objc_setAssociatedObject(self, &SwiftlyFuncCustomProperties.uniqueID, unwrappedValue as NSString?, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
    

}
