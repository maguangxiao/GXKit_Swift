//
//  UIColor+Hex.swift
//  GXKit_Swift
//
//  Created by guangxiao on 2018/1/12.
//  Copyright © 2018年 guangxiao. All rights reserved.
//

import UIKit

extension UIColor {
    class func colorWithCustom(_ r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1)
    }
    
    class func colorWithCustom(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: alpha)
    }
    static var random:UIColor{
        get{
            let r = CGFloat(arc4random_uniform(256))
            let g = CGFloat(arc4random_uniform(256))
            let b = CGFloat(arc4random_uniform(256))
            return UIColor.colorWithCustom(r, g: g, b: b)

        }
    }
}
