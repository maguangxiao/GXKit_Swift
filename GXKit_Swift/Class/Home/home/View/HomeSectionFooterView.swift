//
//  HomeSectionFooterView.swift
//  GXKit_Swift
//
//  Created by guangxiao on 2018/1/12.
//  Copyright © 2018年 guangxiao. All rights reserved.
//

import UIKit

class HomeSectionFooterView: UICollectionReusableView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = GXConfig.Color.BackgroundGray
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
