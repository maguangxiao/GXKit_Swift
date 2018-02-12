//
//  GXTopSlideBar.swift
//  GXKit_Swift
//
//  Created by guangxiao on 2018/1/17.
//  Copyright © 2018年 guangxiao. All rights reserved.
//

import UIKit

class GXTopSlideBar: UIView,UIScrollViewDelegate {
    
    var itemTitleArray:[String] = [String](){
        didSet{
            for i in 0..<itemArray.count{
                if itemTitleArray.count > i{
                    if itemTitleArray[i].contains("("){
                        let str = itemTitleArray[i]
                        let attrTitle = NSMutableAttributedString(string:str)
                        attrTitle.addAttributes([NSAttributedStringKey.foregroundColor:UIColor(hexString:"e72727")!], range: NSMakeRange(3, str.length - 3))
                        attrTitle.addAttributes([NSAttributedStringKey.foregroundColor:GXConfig.Color.Content], range: NSMakeRange(0, 3))
                        itemArray[i].setAttributedTitle(attrTitle, for: UIControlState())
                        let selectedAttrTitle = NSMutableAttributedString(string:str)
                        selectedAttrTitle.addAttributes([NSAttributedStringKey.foregroundColor:UIColor(hexString:"e72727")!], range: NSMakeRange(3, str.length - 3))
                        selectedAttrTitle.addAttributes([NSAttributedStringKey.foregroundColor:GXConfig.Color.Main], range: NSMakeRange(0, 3))
                        itemArray[i].setAttributedTitle(selectedAttrTitle, for: .selected)
                        
                    }else{
                        itemArray[i].setAttributedTitle(nil, for: UIControlState())
                        itemArray[i].setAttributedTitle(nil, for: .selected)
                        itemArray[i].setTitle(itemTitleArray[i], for: UIControlState())
                        itemArray[i].setTitle(itemTitleArray[i], for: .selected)
                    }
                    //                    if i == 0{
                    //                        buttonClick(itemArray[i])
                    //                    }
                }
            }
        }
    }
    var tagArray:[Int] = [0,0,0,0]
    //        Array(count: itemTitleArray.count, repeatedValue: 0)
    var selectedItem:UIButton!
    var bgView:UIView!
    var slideView:UIView!
    
    var items:[UIButton] = [UIButton]()
    /// 选中某一个item之后执行的闭包
    var selectedItemWithTagClosure:((_ tag:Int)->())?
    
    fileprivate var itemArray:[UIButton] = [UIButton]()
    
    convenience init(itemTitles:[String],frame:CGRect = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 40)) {
        self.init(frame:frame)
        itemTitleArray = itemTitles
        
        self.frame = frame
        
        setupBgView()
        setupSlideView(itemTitleArray)
        setupContentView(itemTitleArray)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    /**
     外部可调用方法
     
     - parameter offset: <#offset description#>
     */
    func scrollSmothly(_ offset:CGFloat){
        
        let mayBeTag:CGFloat = offset/GXConfig.Constant.ScreenWidth
        
        if [0.0,1.0,2.0,3.0,4.0,5.0,6.0].contains(mayBeTag){
            selectedItem.isSelected = false
            let aa = viewWithTag(1200 + Int(mayBeTag)) as! UIButton
            aa.isSelected = true
            selectedItem = aa
        }
        
        
        let propertion = offset / (GXConfig.Constant.ScreenWidth * CGFloat(itemTitleArray.count ))
        slideView.layer.position = CGPoint(x: GXConfig.Constant.ScreenWidth * propertion, y: slideView.layer.position.y)
        
        slideView.frame = CGRect(x: GXConfig.Constant.ScreenWidth * propertion, y: bgView.frame.size.height - 1, width: bgView.frame.size.width/CGFloat(itemTitleArray.count), height: 1)
    }
    
    
    
    //====以下为私有方法
    fileprivate func setupBgView(){
        
        self.bgView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height))
        
        bgView.backgroundColor = UIColor.white
        self.addSubview(bgView)
        
    }
    
    fileprivate func setupSlideView(_ itemTitles:[String]){
        let slideView = UIView(frame: CGRect(x: 0, y: bgView!.frame.size.height - 1, width: UIScreen.main.bounds.width / CGFloat(itemTitles.count), height: 1.5))
        slideView.layer.cornerRadius = 1
        slideView.layer.masksToBounds = true
        slideView.backgroundColor = GXConfig.Color.Main
        self.slideView = slideView
        bgView?.addSubview(self.slideView)
    }
    
    fileprivate func setupContentView(_ itemTitles:[String]){
        
        for i in 0..<itemTitles.count{
            
            let itemW = bgView.frame.size.width / CGFloat(itemTitles.count)
            let itemH = bgView.frame.size.height - 1
            let itemX = itemW * CGFloat(i)
            let itemY:CGFloat = 0
            
            let item = UIButton(frame:CGRect(x: itemX, y: itemY, width: itemW, height: itemH))
            
            item.addTarget(self, action: #selector(GXTopSlideBar.buttonClick(_:)), for: .touchUpInside)
            
            item.setTitleColor(GXConfig.Color.Content, for: UIControlState())
            item.setTitleColor(GXConfig.Color.Main, for: .selected)
            
            item.setTitle(itemTitleArray[i], for: UIControlState())
            item.setTitle(itemTitleArray[i], for: .selected)
            
            item.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            
            
            item.tag = 1200 + i
            itemArray.append(item)
            bgView.addSubview(item)
            if i == 0{
                item.isSelected = true
                selectedItem = item
            }
        }
    }
    
    //选中哪一个
    fileprivate func selectItemWithTag(_ tag:Int){
        let item = viewWithTag(tag) as! UIButton
        if item == selectedItem{
            return
        }
        selectedItem.isSelected = false
        item.isSelected = true
        
        addAnimationWithSelectedItem(item)
        selectedItem = item
        
    }
    
    @objc fileprivate func buttonClick(_ sender:UIButton){
        if sender.tag == selectedItem.tag{//如果点击的是之前选中的item就不再做任何操作
            return
        }
        selectedItem.isSelected = false
        sender.isSelected = true
        addAnimationWithSelectedItem(sender)
        
        selectedItem = sender
        selectedItemWithTagClosure?(sender.tag)
    }
    
    //添加移动动画
    fileprivate func addAnimationWithSelectedItem(_ item:UIButton){
        
        let distanceX = item.frame.minX - selectedItem.frame.maxX
        
        //=========以下添加基本动画
        let positionAnimation = CABasicAnimation()
        positionAnimation.keyPath = "position.x"
        positionAnimation.fromValue = slideView.layer.position.x
        positionAnimation.toValue = slideView.layer.position.x + distanceX
        
        slideView.layer.add(positionAnimation, forKey: "basic")
        
        //========以上添加基本动画
        
        slideView.layer.position = CGPoint(x: slideView.layer.position.x + distanceX, y: slideView.layer.position.y)
        
        slideView.frame = CGRect(x: item.frame.minX, y: bgView.frame.size.height - 1, width: bgView.frame.size.width/CGFloat(itemTitleArray.count), height: 1)
    }
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
