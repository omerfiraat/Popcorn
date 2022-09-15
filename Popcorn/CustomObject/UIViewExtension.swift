//
//  UIViewExtension.swift
//  Popcorn
//
//  Created by Ömer Firat on 26.11.2020.
//  Copyright © 2020 Omer Firat. All rights reserved.
//

import UIKit
import FSPagerView

@IBDesignable
extension UIView{
    @IBInspectable var cornerRadius: CGFloat{
        get{return self.layer.cornerRadius}
        set{self.layer.cornerRadius = newValue}
    }
    
}

