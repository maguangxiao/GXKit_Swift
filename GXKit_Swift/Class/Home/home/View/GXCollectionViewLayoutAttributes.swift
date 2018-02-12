//
//  GXCollectionViewLayoutAttributes.swift
//  GXKit_Swift
//
//  Created by guangxiao on 2018/1/15.
//  Copyright © 2018年 guangxiao. All rights reserved.
//

import UIKit
fileprivate let SectionBackground = "GXCollectionReusableView"

private class GXCollectionViewLayoutAttributes: UICollectionViewLayoutAttributes {
    var backgroundColor = UIColor.clear
    override func copy(with zone: NSZone? = nil) -> Any {
        if let copy = super.copy(with: zone) as? GXCollectionViewLayoutAttributes{
            copy.backgroundColor = self.backgroundColor
            return copy
        }
        return super.copy(with: zone)
    }
    override func isEqual(_ object: Any?) -> Bool {
        guard let rhs = object as? GXCollectionViewLayoutAttributes else{
            return false
        }
        if !self.backgroundColor.isEqual(rhs.backgroundColor){
            return false
        }
        return super.isEqual(object)
    }

}

class GXCollectionReusableView:UICollectionReusableView{
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        guard let attr = layoutAttributes as? GXCollectionViewLayoutAttributes else{
            return
        }
        self.backgroundColor = attr.backgroundColor
    }
}
protocol GXCollectionViewDelegateFlowLayout:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView:UICollectionView,layout collectionViewLayout:UICollectionViewLayout,backgroundColorForSectionAt section:Int) -> UIColor
    
}
extension GXCollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView:UICollectionView,layout collectionViewLayout:UICollectionViewLayout,backgroundColorForSectionAt section:Int) -> UIColor{
        return UIColor.clear
    }

}
class GXCollectionViewFlowLayout : UICollectionViewFlowLayout{
    private var decorationViewAttrs:[UICollectionViewLayoutAttributes] = []
    
    override init() {
        super.init()
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    func setup(){
        self.register(GXCollectionReusableView.classForCoder(), forDecorationViewOfKind: SectionBackground)
    }
    
    override func prepare() {
        super.prepare()
        guard let numberOfSections = self.collectionView?.numberOfSections,let delegate = self.collectionView?.delegate as? GXCollectionViewDelegateFlowLayout else{
            return
        }
        
        self.decorationViewAttrs.removeAll()
        
        guard let collecView = self.collectionView else{
            return
        }
        for section in 0..<numberOfSections{
            guard let numberOfItems = self.collectionView?.numberOfItems(inSection: section),numberOfItems > 0,let firstItem = self.layoutAttributesForItem(at: IndexPath(item: 0, section: section)),let lastItem = self.layoutAttributesForItem(at: IndexPath(item: numberOfItems - 1, section: section)) else{
                continue
            }
            
            var sectionInset = self.sectionInset
            if let inset = delegate.collectionView?(collecView, layout: self, insetForSectionAt: section){
                sectionInset = inset
            }
            var sectionFrame = firstItem.frame.union(lastItem.frame)
            sectionFrame.origin.x = 0
            sectionFrame.origin.y -= sectionInset.top
            
            if self.scrollDirection == .horizontal{
                sectionFrame.size.width += sectionInset.left + sectionInset.right
                sectionFrame.size.height = collecView.frame.height
            }else{
                sectionFrame.size.width = collecView.frame.width
                sectionFrame.size.height += sectionInset.top + sectionInset.bottom
            }
            
            let attr = GXCollectionViewLayoutAttributes(forDecorationViewOfKind: SectionBackground, with: IndexPath(item: 0, section: section))
            attr.frame = sectionFrame
            attr.zIndex = -1
            attr.backgroundColor = delegate.collectionView(collecView, layout: self, backgroundColorForSectionAt: section)
            self.decorationViewAttrs.append(attr)
            
        }
        
    }
    
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        var attrs = super.layoutAttributesForElements(in: rect)
        
        attrs?.append(contentsOf: self.decorationViewAttrs.filter({ (attr) -> Bool in
            return rect.intersects(attr.frame)
        }))
        
        return attrs
    }
    
    override func layoutAttributesForDecorationView(ofKind elementKind: String, at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        if elementKind == SectionBackground{
            return self.decorationViewAttrs[indexPath.section]
        }
        return super.layoutAttributesForDecorationView(ofKind: elementKind, at: indexPath)
    }
    
    
    
    
    
    
    
}
