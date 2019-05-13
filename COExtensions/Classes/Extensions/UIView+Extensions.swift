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
    
    @IBInspectable var topCornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            let rectShape = CAShapeLayer()
            rectShape.bounds = self.frame
            rectShape.position = self.center
            rectShape.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: newValue, height: newValue)).cgPath
            
            self.layer.mask = rectShape
        }
    }
    
    @IBInspectable var bottomCornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            let rectShape = CAShapeLayer()
            rectShape.bounds = self.frame
            rectShape.position = self.center
            rectShape.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.bottomLeft, .bottomRight], cornerRadii: CGSize(width: newValue, height: newValue)).cgPath
            
            self.layer.mask = rectShape
        }
    }
    
    @IBInspectable var topLeftCornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            let rectShape = CAShapeLayer()
            rectShape.bounds = self.frame
            rectShape.position = self.center
            rectShape.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft], cornerRadii: CGSize(width: newValue, height: newValue)).cgPath
            
            self.layer.mask = rectShape
        }
    }
    
    @IBInspectable var topRightCornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            let rectShape = CAShapeLayer()
            rectShape.bounds = self.frame
            rectShape.position = self.center
            rectShape.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topRight], cornerRadii: CGSize(width: newValue, height: newValue)).cgPath
            
            self.layer.mask = rectShape
        }
    }
    
    @IBInspectable var bottomLeftCornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            let rectShape = CAShapeLayer()
            rectShape.bounds = self.frame
            rectShape.position = self.center
            rectShape.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.bottomLeft], cornerRadii: CGSize(width: newValue, height: newValue)).cgPath
            
            self.layer.mask = rectShape
        }
    }
    
    @IBInspectable var bottomRightCornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            let rectShape = CAShapeLayer()
            rectShape.bounds = self.frame
            rectShape.position = self.center
            rectShape.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.bottomRight], cornerRadii: CGSize(width: newValue, height: newValue)).cgPath
            
            self.layer.mask = rectShape
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
    
    func addShadowBezierPath(_ width:CGFloat=0, height:CGFloat=2.0, Opacidade:Float=0.5, maskToBounds:Bool=false, radius:CGFloat=2.0){
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: width, height: height)
        layer.shadowRadius = radius
        layer.shadowOpacity = Opacidade
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: self.layer.cornerRadius).cgPath
    }
    /*
     extension UIView{
     
     func addShadow(){
     self.layer.shadowOffset =  CGSize(width: 0, height: 1)   // CGSizeMake(0, 1)
     self.layer.shadowColor = UIColor.black.cgColor
     self.layer.shadowRadius = 1.5
     self.layer.shadowOpacity = 0.30
     self.layer.cornerRadius = 1
     self.clipsToBounds = true
     self.layer.masksToBounds = false
     }
     func addShadow(_ offset:CGSize, color:UIColor, radius:CGFloat, opacity:Float, cornerRadius:CGFloat, clipBounds:Bool, maskBounds:Bool){
     self.layer.shadowOffset =  offset
     self.layer.shadowColor = color.cgColor
     self.layer.shadowRadius = radius
     self.layer.shadowOpacity = opacity
     self.layer.cornerRadius = cornerRadius
     self.clipsToBounds = clipBounds
     self.layer.masksToBounds = maskBounds
     }
     }
     */
    
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
extension UIView {
    func roundCorners(corners:UIRectCorner, radius: CGFloat,width:CGFloat) {
        let path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: width, height: self.frame.height), byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        mask.frame = self.bounds
        self.layer.mask = mask
    }
}
