//
//  GXMainTabBarViewController.swift
//  GXKit_Swift
//
//  Created by guangxiao on 2018/1/11.
//  Copyright © 2018年 guangxiao. All rights reserved.
//

import UIKit

class GXMainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //添加自控制器
        buildChildViewControllers()
        
        //图标颜色
        UITabBar.appearance().tintColor = UIColor.blue
        //tabBar背景色
        self.tabBar.barTintColor = UIColor(red: 248.0/255.0, green: 248.0/255.0, blue: 248.0/255.0, alpha: 1)
        
    }

    private func buildChildViewControllers(){
        let homeVC = HomeViewController()
        let mineVC = MineViewController()
        buildChildViewControllerWith(childVC: homeVC, title: "首页", imageName: "home", selectedImageName: "home_selected", tag: 0)
        buildChildViewControllerWith(childVC: mineVC, title: "我的", imageName: "mine", selectedImageName: "mine_selected", tag: 1)
    }

    private func buildChildViewControllerWith(childVC:UIViewController,title:String,imageName:String,selectedImageName:String,tag:Int){
        let tabBarItem = UITabBarItem(title: title, image: UIImage(named:imageName), selectedImage: UIImage(named:selectedImageName))
        tabBarItem.tag = tag
        childVC.tabBarItem = tabBarItem
        
        let naviVC = GXNavigationController(rootViewController: childVC)
        self.addChildViewController(naviVC)
        
    }
}
