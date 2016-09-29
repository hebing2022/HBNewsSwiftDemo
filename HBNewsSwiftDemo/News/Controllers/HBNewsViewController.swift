//
//  HBNewsViewController.swift
//  HBNews
//
//  Created by hebing on 16/9/26.
//  Copyright © 2016年 hebing. All rights reserved.
//

import Foundation
import UIKit
//设备屏幕尺寸
public let SCREEN_WIDTH = UIScreen.main.bounds.size.width
public let SCREEN_HEIGHT = UIScreen.main.bounds.size.height

class HBNewsViewController: HBBaseViewController {
    
    var bigScrollView: UIScrollView?
    var titleCollection: HBTitleSelectCollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        self.edgesForExtendedLayout = UIRectEdge(rawValue: UInt(0))
        
        initTitleCollection()
        
        initBigScrollView()
    }
    
    
    func initTitleCollection() {
        
        titleCollection = HBTitleSelectCollectionView(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: 40))
        titleCollection?.hbDelegate = self
        titleCollection?.titleArray = ["测试","测试","测试","测试","测试","测试","测试"]
        self.view.addSubview(titleCollection!)
        
    }
    
    func initBigScrollView() {
        
        bigScrollView = UIScrollView.init(frame: CGRect.init(x: 0, y: 40, width: SCREEN_WIDTH, height: SCREEN_HEIGHT - 40))
        bigScrollView?.bounces = false
        bigScrollView?.isPagingEnabled = true
        bigScrollView?.delegate = self
        self.view.addSubview(bigScrollView!)
        
        let VC1 = DemoVC1()
        let VC2 = DemoVC2()
        let VC3 = DemoVC3()
        let VC4 = DemoVC4()
        let VC5 = DemoVC5()
        let VC6 = DemoVC6()
        let VC7 = DemoVC7()
        
        self.addChildViewController(VC1)
        self.addChildViewController(VC2)
        self.addChildViewController(VC3)
        self.addChildViewController(VC4)
        self.addChildViewController(VC5)
        self.addChildViewController(VC6)
        self.addChildViewController(VC7)
        
        bigScrollView?.contentSize = CGSize.init(width: SCREEN_WIDTH * CGFloat(self.childViewControllers.count), height: SCREEN_HEIGHT - 40)
        
        VC1.view.frame = (bigScrollView?.bounds)!
        bigScrollView?.addSubview(VC1.view)

    }
    
}
extension HBNewsViewController: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        scrollViewDidEndScrollingAnimation(scrollView)
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        
        let index:Int = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
        let VC = self.childViewControllers[index]
        VC.view.frame = (bigScrollView?.bounds)!
        bigScrollView?.addSubview(VC.view)
        
        let indexPath = NSIndexPath.init(item: index, section: 0)
        titleCollection?.collectionView(titleCollection!, didSelectItemAt: indexPath as IndexPath)
        
    }

}
extension HBNewsViewController: HBTitleSelectCollectionViewDelegate {
    
    func HBTitleSelectCollection(collectionView: HBTitleSelectCollectionView, indexPath: NSIndexPath) {
        
        bigScrollView?.setContentOffset(CGPoint.init(x: SCREEN_WIDTH * CGFloat(indexPath.row), y: 0), animated: true)
    }
}
