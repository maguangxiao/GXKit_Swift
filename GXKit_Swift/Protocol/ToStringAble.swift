//
//  ToStringAble.swift
//  GXKit_Swift
//
//  Created by guangxiao on 2018/2/12.
//  Copyright © 2018年 guangxiao. All rights reserved.
//

import UIKit

protocol ToStringAble {
    func toString()->String
}
extension ToStringAble{
    func toString()->String{
        return "\(self)"
    }
}

extension Int:ToStringAble{}

extension Int64:ToStringAble{}

extension Double:ToStringAble{}

extension Float:ToStringAble{}

extension CGFloat:ToStringAble{}

