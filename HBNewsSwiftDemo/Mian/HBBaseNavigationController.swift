//
//  HBBaseNavigationController.swift
//  HBNews
//
//  Created by hebing on 16/9/26.
//  Copyright © 2016年 hebing. All rights reserved.
//

import Foundation
import UIKit

class HBBaseNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        UINavigationBar.appearance().barTintColor = UIColor.red
        UITabBar.appearance().tintColor = UIColor.red
    }
    
}
