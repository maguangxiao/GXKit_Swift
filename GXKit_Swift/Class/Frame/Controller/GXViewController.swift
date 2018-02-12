//
//  GXViewController.swift
//  GXKit_Swift
//
//  Created by guangxiao on 2018/1/12.
//  Copyright © 2018年 guangxiao. All rights reserved.
//

import UIKit

class GXViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        if #available(iOS 11, *){
            
        }else{
            navigationController?.automaticallyAdjustsScrollViewInsets = false

            self.automaticallyAdjustsScrollViewInsets = false
        }
        if let _ = self.navigationController{
            navBarShadowImageHidden = true
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
