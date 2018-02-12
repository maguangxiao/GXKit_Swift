//
//  HomeViewController.swift
//  GXKit_Swift
//
//  Created by guangxiao on 2018/1/11.
//  Copyright © 2018年 guangxiao. All rights reserved.
//

import UIKit

class HomeViewController: GXViewController {

    private var collectionView:UICollectionView!
    /// navigationbar是否是透明状态 默认为是
    fileprivate var isNavBarOpeque:Bool = true
    //各section的数据源
    var homeBtnDataSource:[String] = [String](){
        didSet{
            collectionView.reloadData()
        }
    }
    var submitDataSource:[String] = [String](){
        didSet{
            collectionView.reloadData()
        }
    }
    var forexrateDataSource:[String] = [String](){
        didSet{
            collectionView.reloadData()
        }
    }
    var supplyDataSource:[String] = [String](){
        didSet{
            collectionView.reloadData()
        }
    }
    var purchaseDataSource:[String] = [String](){
        didSet{
            collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "首页"
        initCollectionView()
        setupPageScrollView()
        loadData()
        
        navBarBackgroundAlpha = 0
        if #available(iOS 11, *){
            collectionView.contentInsetAdjustmentBehavior = .never
        }
        let a:Int = 34
        let c = a.toString()
        print(c)
        let aa:Int64 = 989
        print(aa.toString())
        
        let bb:Double = 209.99
        print(bb.toString())
        
        let cc:Float = 3240.09
        print(cc.toString())
    }
    
    private func initCollectionView(){
        let flowLayout = GXCollectionViewFlowLayout()
        flowLayout.estimatedItemSize = CGSize(width: 30, height: 30)
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 0
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = GXConfig.Color.BackgroundWhite
        collectionView.register(HomeRecommentCollectionViewCell.self, forCellWithReuseIdentifier: HomeRecommentCollectionViewCell.gx_reuseIdentifier)
        collectionView.register(HomeSubmitCollectionViewCell.self, forCellWithReuseIdentifier: HomeSubmitCollectionViewCell.gx_reuseIdentifier)
        collectionView.register(HomeForexrateCollectionViewCell.self, forCellWithReuseIdentifier: HomeForexrateCollectionViewCell.gx_reuseIdentifier)
        collectionView.register(HomeSupplyCollectionViewCell.self, forCellWithReuseIdentifier: HomeSupplyCollectionViewCell.gx_reuseIdentifier)

        collectionView.register(HomePurchaseCollectionViewCell.self, forCellWithReuseIdentifier: HomePurchaseCollectionViewCell.gx_reuseIdentifier)
        collectionView.register(HomeSectionHeaderView.self, forSupplementaryViewOfKind:UICollectionElementKindSectionHeader, withReuseIdentifier: HomeSectionHeaderView.gx_reuseIdentifier)
        collectionView.register(HomeSectionFooterView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: HomeSectionFooterView.gx_reuseIdentifier)

        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.frame = CGRect(x: 0, y: 0, width: GXConfig.Constant.ScreenWidth, height: GXConfig.Constant.ScreenHeight-GXConfig.Constant.TabBarHeight)
    }
    private func setupPageScrollView(){
        let pageScrollViewHeight:CGFloat = GXConfig.Constant.ScreenWidth * 0.6
        collectionView.contentInset = UIEdgeInsetsMake(pageScrollViewHeight, 0, 0, 0)

        let pageScrollView = GXAutoPageScrollView(frame: CGRect(x: 0, y: -pageScrollViewHeight, width: GXConfig.Constant.ScreenWidth, height: pageScrollViewHeight))
        collectionView.addSubview(pageScrollView)
        
    }
    private func loadData(){
        homeBtnDataSource = ["a","fdid","ddid ","kl","a","fdid","ddid ","kl"]
        submitDataSource = ["",""]
        supplyDataSource = ["","","",""]
        forexrateDataSource = ["m","m","m","m"]
        purchaseDataSource = ["m","m","m","m"]
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
extension HomeViewController:UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return homeBtnDataSource.count
        case 1:
            return submitDataSource.count
        case 2:
            return forexrateDataSource.count
        case 3:
            return supplyDataSource.count
        case 4:
            return purchaseDataSource.count
        default:
            return 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeRecommentCollectionViewCell.gx_reuseIdentifier, for: indexPath)
            
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeSubmitCollectionViewCell.gx_reuseIdentifier, for: indexPath) as! HomeSubmitCollectionViewCell
            cell.isSubmitSupply = indexPath.row == 0
            
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeForexrateCollectionViewCell.gx_reuseIdentifier, for: indexPath)
            
            return cell
        case 3:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeSupplyCollectionViewCell.gx_reuseIdentifier, for: indexPath)
            
            return cell
        case 4:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomePurchaseCollectionViewCell.gx_reuseIdentifier, for: indexPath)
            
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomePurchaseCollectionViewCell.gx_reuseIdentifier, for: indexPath)
            return cell
        }
        
    }

    
//    func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, at indexPath: IndexPath) {
//        <#code#>
//    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionElementKindSectionHeader{
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HomeSectionHeaderView.gx_reuseIdentifier, for: indexPath)
            return header
        }else{
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HomeSectionFooterView.gx_reuseIdentifier, for: indexPath)
            return footer
        }
    }
}

extension HomeViewController:UICollectionViewDelegateFlowLayout{
    //======各个section的edgeInset
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        switch section {
        case 0:
            return UIEdgeInsetsMake(0, GXConfig.Constant.EdgeBetweenContentAndWall, 0, GXConfig.Constant.EdgeBetweenContentAndWall)
        case 1:
            return UIEdgeInsetsMake(18, GXConfig.Constant.EdgeBetweenContentAndWall, 18, GXConfig.Constant.EdgeBetweenContentAndWall)
        case 2:
            return UIEdgeInsets.zero
        case 3,4:
            return UIEdgeInsetsMake(GXConfig.Constant.EdgeBetweenContentAndWall, GXConfig.Constant.EdgeBetweenContentAndWall, GXConfig.Constant.EdgeBetweenContentAndWall, GXConfig.Constant.EdgeBetweenContentAndWall)
        default:
            return UIEdgeInsets.zero
        }
    }

    //======各个section 中Item间 的上下间距 和左右间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        switch section {
        case 0,1,2:
            return CGFloat.leastNormalMagnitude
        
        default:
            return GXConfig.Constant.LineSpacingBetweenTwoItemsInCollectionView
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        switch section {
        case 0,2,4:
            return CGFloat.leastNormalMagnitude
            
        case 1,3:
            return GXConfig.Constant.InteritemSpacingBetweenTwoItemsInCollectionView
        default:
            return CGFloat.leastNormalMagnitude
        }
    }

    //=====各个section的Item尺寸
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            let width:CGFloat = CGFloat(Int((GXConfig.Constant.ScreenWidth - GXConfig.Constant.EdgeBetweenContentAndWall * 2)/4))
            let height:CGFloat = width
            return CGSize(width: width, height: height)
        case 1:
            let width:CGFloat = (GXConfig.Constant.ScreenWidth - GXConfig.Constant.EdgeBetweenContentAndWall * 2 - GXConfig.Constant.InteritemSpacingBetweenTwoItemsInCollectionView)/2
            return CGSize(width:width,height:49)
        case 2:
            if indexPath.row == 0{
                return CGSize(width: GXConfig.Constant.ScreenWidth, height: 49)
            }else{
                return CGSize(width: GXConfig.Constant.ScreenWidth, height: 54)
            }
        case 3:
            let width:CGFloat = CGFloat(Int((GXConfig.Constant.ScreenWidth - GXConfig.Constant.EdgeBetweenContentAndWall * 2 - GXConfig.Constant.InteritemSpacingBetweenTwoItemsInCollectionView)/2))
            let height:CGFloat = width * 1.25
            
            return CGSize(width: width, height: height)
        case 4:
            let width:CGFloat = GXConfig.Constant.ScreenWidth - GXConfig.Constant.EdgeBetweenContentAndWall * 2
            
            return CGSize(width: width, height: 120)

        default:
            return CGSize(width: 100, height: 30)
        }
    }
    //======各个section footer 和 header的尺寸
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        switch section {
        case 0,1,4:
            return CGSize.zero
        default:
            return CGSize(width: GXConfig.Constant.ScreenWidth, height: GXConfig.Constant.HeightForSectionFooter)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        switch section {
        case 0,1:
            return CGSize.zero
        default:
            return CGSize(width: GXConfig.Constant.ScreenWidth, height: GXConfig.Constant.HeightForSectionHeader)
        }
    }
    
}
extension HomeViewController:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.section,indexPath.row)
        if indexPath.section == 0{
            let vc = GXCollectionViewControlller()
            navigationController?.pushViewController(vc, animated: true)
        }else{
//            let vc = GXQueryHistoryViewController()
//
//            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}


extension HomeViewController:GXCollectionViewDelegateFlowLayout{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == collectionView{
            let offsetY = scrollView.contentOffset.y
            
            if offsetY >= -GXConfig.Constant.NavBarHeight {
                if isNavBarOpeque{
                    isNavBarOpeque = false
                    UIView.animate(withDuration: 0.415, animations: {[weak self] in
                        guard let `self` = self else{return}
                        self.navBarBackgroundAlpha = 1

                    })
                }
            }else {
                if !isNavBarOpeque{
                    isNavBarOpeque = true
                    UIView.animate(withDuration: 0.415, animations: {[weak self] in
                        guard let `self` = self else{return}
                        self.navBarBackgroundAlpha = 0
                        
                    })
                }
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, backgroundColorForSectionAt section: Int) -> UIColor {
        if section == 1{
            return GXConfig.Color.BackgroundGray
        }else{
            return GXConfig.Color.BackgroundWhite
        }
    }
}
