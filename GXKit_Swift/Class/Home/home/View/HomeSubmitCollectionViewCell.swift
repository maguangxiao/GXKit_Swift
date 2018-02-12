//
//  HomeSubmitCollectionViewCell.swift
//  GXKit_Swift
//
//  Created by guangxiao on 2018/1/12.
//  Copyright © 2018年 guangxiao. All rights reserved.
//

import UIKit

class HomeSubmitCollectionViewCell: UICollectionViewCell {
    
    /// 是否是发布货源
    var isSubmitSupply:Bool = true
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.blue
//        addSubview(button)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        button.frame = self.frame
//        let x:CGFloat = isSubmitSupply ? GXConfig.Constant.EdgeBetweenContentAndWall : GXConfig.Constant.InteritemSpacingBetweenTwoItemsInCollectionView / 2
//        let y:CGFloat = 18
//        let w:CGFloat = self.frame.size.width - x - GXConfig.Constant.InteritemSpacingBetweenTwoItemsInCollectionView / 2
//        let w2:CGFloat = self.frame.size.width - x - GXConfig.Constant.EdgeBetweenContentAndWall
//        let realW:CGFloat = isSubmitSupply ? w : w2
//        let h:CGFloat = 46
//        button.frame = CGRect(x: x, y: y, width: realW, height: h)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    lazy var button:UIButton = {
        let button = UIButton(frame: CGRect.zero)
        button.backgroundColor = GXConfig.Color.Main
        return button
    }()
}
