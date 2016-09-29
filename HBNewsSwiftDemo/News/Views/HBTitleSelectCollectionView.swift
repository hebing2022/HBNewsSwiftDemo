//
//  HBTitleSelectCollectionView.swift
//  HBNews
//
//  Created by hebing on 16/9/26.
//  Copyright © 2016年 hebing. All rights reserved.
//

import Foundation
import UIKit

class HBTitleSelectCollectionView: UICollectionView {
    
    var titleArray = [String]()
    {
        didSet
        {
            for i in 0 ..< titleArray.count
            {
                let model = TitleModel()
                model.title = titleArray[i]
                model.isSelected = i == 0 ? true : false
                titleModelArray.add(model)
            }
            
            self.reloadData()
        }
    }
    
    lazy var titleModelArray: NSMutableArray = {
       
        var array = NSMutableArray()
        
        return array
    }()
    
    
    weak var hbDelegate: HBTitleSelectCollectionViewDelegate?
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.itemSize = CGSize.init(width: 80, height: frame.size.height)
        
        super.init(frame: frame, collectionViewLayout: flowLayout)
        
        self.delegate = self
        self.dataSource = self

        self.backgroundColor = UIColor.white
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        self.register(HBTitleCell.classForCoder(), forCellWithReuseIdentifier: "cell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension HBTitleSelectCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int{
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return titleModelArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? HBTitleCell
        
        cell?.model = titleModelArray[indexPath.row] as? TitleModel
        
        
        
        return cell!
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        for i in 0 ..< titleModelArray.count {
            
            let model = titleModelArray[i] as? TitleModel
            model?.isSelected = i == indexPath.row ? true :false
        }
        
        collectionView.scrollToItem(at: indexPath, at: UICollectionViewScrollPosition.centeredHorizontally, animated: true)
        
        hbDelegate?.HBTitleSelectCollection(collectionView: collectionView as! HBTitleSelectCollectionView, indexPath: indexPath as NSIndexPath)
        
        self.reloadData()
    }
    
}
protocol HBTitleSelectCollectionViewDelegate: NSObjectProtocol {
    
    func HBTitleSelectCollection(collectionView: HBTitleSelectCollectionView, indexPath: NSIndexPath)
}
