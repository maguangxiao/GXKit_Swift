//
//  GlobalConstant.swift
//  GXKit_Swift
//
//  Created by guangxiao on 2018/1/12.
//  Copyright © 2018年 guangxiao. All rights reserved.
//

import UIKit

final class GXConfig{
    struct Constant{
        static let ScreenBounds:CGRect = UIScreen.main.bounds
        static let ScreenSize:CGSize = ScreenBounds.size
        static let ScreenHeight:CGFloat = ScreenSize.height
        static let ScreenWidth:CGFloat = ScreenSize.width
        static let TabBarHeight:CGFloat = Appearance.isIphoneX ? 83 : 49
        static let NavBarHeight:CGFloat = Appearance.isIphoneX ? 88 : 64
        
        
        static let EdgeBetweenContentAndWall:CGFloat = 12
        /// collectionView item的标准行间距
        static let LineSpacingBetweenTwoItemsInCollectionView:CGFloat = 12
        
        /// collectionView 两个平行item的之间的间距
        static let InteritemSpacingBetweenTwoItemsInCollectionView:CGFloat = 8
        
        static let HeightForSectionHeader:CGFloat = 46
        
        static let HeightForSectionFooter:CGFloat = 12
    }
    struct Color {
        static let BackgroundGray:UIColor = UIColor(hexString: "f8f8f8")
        static let BackgroundWhite:UIColor = UIColor(hexString: "ffffff")
        static let Content:UIColor = UIColor(hexString:"494949")
        static let Detail:UIColor = UIColor(hexString:"888888")
        static let Line:UIColor = UIColor(hexString:"e2e2e2")
        static let Main:UIColor = UIColor(hexString:"22F9FF")
    }
    
    struct Appearance{
        static let isIphoneX:Bool = Constant.ScreenHeight == 812 ? true : false
    }
    
    struct Notify {
        
    }
}

