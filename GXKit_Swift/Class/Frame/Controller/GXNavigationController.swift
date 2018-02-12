//
//  GXNavigationController.swift
//  GXKit_Swift
//
//  Created by guangxiao on 2018/1/12.
//  Copyright © 2018年 guangxiao. All rights reserved.
//

import UIKit

class GXNavigationController: UINavigationController {

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if childViewControllers.count > 0{
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
}
