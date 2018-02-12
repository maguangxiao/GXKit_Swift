//
//  SoundManage.swift
//  EmulianManager
//
//  Created by GuangXiao on 2017/9/28.
//  Copyright © 2017年 emulian. All rights reserved.
//
import UIKit
import AudioToolbox /* 记得导入*/

class SoundManage: NSObject {
    static var dict:[String:SystemSoundID] = [String:SystemSoundID]()
    
    //通过音效文件名 播放自定义音效
    func playSoundWithFileName(fileName:String){
        var soundID = SoundManage.dict[fileName] ?? 0
        
        if soundID == 0{
            if let path = Bundle.main.path(forResource: fileName, ofType: nil){
                let baseURL = URL(fileURLWithPath: path)
                AudioServicesCreateSystemSoundID(baseURL as CFURL, &soundID)
                SoundManage.dict[fileName] = soundID
            }
        }
        //播放声音
        AudioServicesPlaySystemSound(soundID)
    }
    
    /**
     销毁音效的soundID
     
     - parameter fileName: 文件名
     */
    func disposeMusicWithFileName(fileName:String){
        if let soundID = SoundManage.dict[fileName]{
            AudioServicesDisposeSystemSoundID(soundID)
            SoundManage.dict.removeValue(forKey: fileName)
        }
    }
    
}
