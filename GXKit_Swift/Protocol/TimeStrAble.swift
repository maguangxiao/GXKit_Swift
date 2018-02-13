//
//  TimeStrAble.swift
//  GXKit_Swift
//
//  Created by guangxiao on 2018/2/12.
//  Copyright © 2018年 guangxiao. All rights reserved.
//

import UIKit

protocol TimeStrAble {
    func toTimeStr(with formatter:String)->String
}

extension TimeStrAble{
    
    func toTimeStr(with formatter:String)->String{
        
        let aType = Self.self
        
        var timeStamp:Double = 0.0
        
        if aType == Int.self,let intSelf = self as? Int{
            
            if intSelf.toString().length > 10{
                let str = intSelf.toString().dropLast(intSelf.toString().length - 10)
                timeStamp = Double.init(str) ?? 0.0

            }else{
                timeStamp = Double.init(intSelf)
            }
            
        }
        else if aType == Int64.self,let int64Self = self as? Int64{
            
            timeStamp = Double.init(int64Self)
            
        }
        else if aType == Double.self,let doubleSelf = self as? Double{
            
            timeStamp = doubleSelf
            
        }
        else if aType == String.self,let stringSelf = self as? String{
            
            timeStamp = Double.init(stringSelf) ?? 0.0
            
        }
        
        let dataFormatter = DateFormatter()
        dataFormatter.timeStyle = .short
        dataFormatter.dateFormat = formatter
        dataFormatter.timeZone = TimeZone.current
        dataFormatter.locale = Locale.current
        let date = Date(timeIntervalSince1970: timeStamp)
        return dataFormatter.string(from: date)
    }
}

extension Int:TimeStrAble{}

extension Int64:TimeStrAble{}

extension Double:TimeStrAble{}

extension String:TimeStrAble{}

