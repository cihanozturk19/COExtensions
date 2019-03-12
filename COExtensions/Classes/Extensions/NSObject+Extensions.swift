//
//  NSObject+Extensions.swift
//  QDMSv2
//
//  Created by BIMSERMAC on 1.02.2019.
//  Copyright © 2019 Bimser. All rights reserved.
//

import Foundation
import UIKit

extension NSObject {
    public var className: String {
        return type(of: self).className
    }
    
    public static var className: String {
        return String(describing: self)
    }
}
 
