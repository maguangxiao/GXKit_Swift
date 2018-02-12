//
//  Reusable.swift
//  GXKit_Swift
//
//  Created by guangxiao on 2018/1/12.
//  Copyright © 2018年 guangxiao. All rights reserved.
//

import UIKit

protocol GXReusable:class {
    static var gx_reuseIdentifier:String{get}
}

extension UITableViewCell:GXReusable{
    static var gx_reuseIdentifier:String{
        return String(describing: self)
    }
}

extension UICollectionReusableView:GXReusable{
    static var gx_reuseIdentifier:String{
        return String(describing: self)
    }
}

