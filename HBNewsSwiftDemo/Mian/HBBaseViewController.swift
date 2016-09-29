//
//  HBBaseViewController.swift
//  HBNews
//
//  Created by hebing on 16/9/26.
//  Copyright © 2016年 hebing. All rights reserved.
//

import Foundation
import UIKit

class HBBaseViewController: UIViewController  {
    
    var titleLabel = UILabel()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.green
        titleLabel.textColor = UIColor.black
        titleLabel.frame = CGRect.init(x: 0, y: 0, width: 100, height: 40)
        titleLabel.center = self.view.center
        self.view.addSubview(titleLabel)
    }
    
}
