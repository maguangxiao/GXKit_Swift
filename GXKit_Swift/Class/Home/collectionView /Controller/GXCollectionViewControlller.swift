//
//  GXCollectionViewControlller.swift
//  GXKit_Swift
//
//  Created by guangxiao on 2018/1/25.
//  Copyright © 2018年 guangxiao. All rights reserved.
//

import UIKit

class GXCollectionViewControlller: GXViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    var collectionView:UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        
        
        let collectionViewY:CGFloat = 0
        //        let collectionViewY:CGFloat = 0
        
        //底部collectionView的高度等于屏幕高度 - 顶部位置 - 底部tabBar的高度
        let collectionViewH:CGFloat = GXConfig.Constant.ScreenHeight - GXConfig.Constant.NavBarHeight
        
        flowLayout.itemSize = CGSize(width: GXConfig.Constant.ScreenWidth , height: 120)
        collectionView = UICollectionView(frame: CGRect(x: 0, y: collectionViewY, width: GXConfig.Constant.ScreenWidth, height: collectionViewH), collectionViewLayout: flowLayout)
        collectionView.scrollsToTop = false
        
        collectionView.isPagingEnabled = true
        collectionView.bounces = false
        collectionView.showsHorizontalScrollIndicator = false
        view.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = GXConfig.Color.BackgroundGray
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "UICollectionViewCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UICollectionViewCell", for: indexPath)
        cell.backgroundColor = UIColor.random
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.section,indexPath.row)
    }
}
