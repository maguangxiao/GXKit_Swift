//
//  Network.swift
//  GXKit_Swift
//
//  Created by guangxiao on 2017/10/11.
//  Copyright © 2017年 guangxiao. All rights reserved.
//

import UIKit
struct Network {
    
    
    
    static func uploadImage(image:UIImage?,successClosure:@escaping (()->()),failureClosure:(()->())?,progressClosure:((_ progress:CGFloat)->())?){
        guard let _ = image else{
            failureClosure?()
            return
        }
        var i = 0
        DispatchQueue.global().async {
            while i < 100000{
                DispatchQueue.main.async {
                    
                    progressClosure?(CGFloat(i)/100000.0 )
                }
                i = i + 1
            }
            DispatchQueue.main.async {
                
                let isSuccess = arc4random() % 2 == 0
                if isSuccess{
                    successClosure()
                }else{
                    failureClosure?()
                }
            }
        }
        
        
        
        
        
    }
    
    
}

