//
//  HBBaseTabBarController.swift
//  HBNews
//
//  Created by hebing on 16/9/26.
//  Copyright © 2016年 hebing. All rights reserved.
//

import Foundation
import UIKit

class HBBaseTabBarController: UITabBarController {
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        initChildViewController()
        
    }
    
    func initChildViewController()
    {
        var norArray = ["tabbar_icon_news_normal","tabbar_icon_reader_normal","tabbar_icon_media_normal","tabbar_icon_found_normal","tabbar_icon_me_normal"]
        
        var selectArray = ["tabbar_icon_news_highlight","tabbar_icon_reader_highlight","tabbar_icon_media_highlight","tabbar_icon_found_highlight","tabbar_icon_me_highlight"]
        
        var titleArray = ["新闻","阅读","视听","发现","我"]
        
        for index in 0 ..< norArray.count {
            
            index == 0 ? setNorImage(norName: norArray[index], selectName: selectArray[index], title: titleArray[index], controller: HBNewsViewController()) : setNorImage(norName: norArray[index], selectName: selectArray[index], title: titleArray[index], controller: HBBaseViewController()) 
        }
        
    }
    
    func setNorImage(norName:String?,selectName:String?,title:String?,controller:HBBaseViewController?) {
        
        
        controller?.tabBarItem.title = title
        controller?.tabBarItem.image = UIImage.init(named: norName!)
        controller?.tabBarItem.selectedImage = UIImage.init(named: selectName!)
        
        let nav = HBBaseNavigationController(rootViewController: controller!)
        addChildViewController(nav)
        
    }
    
}
