//
//  DemoVC7.swift
//  HBNewsSwiftDemo
//
//  Created by hebing on 16/9/29.
//  Copyright © 2016年 hebing. All rights reserved.
//

import Foundation
import UIKit

class DemoVC7: HBBaseViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.brown
        
        titleLabel.text = String(describing: self.classForCoder)
    }
    
}
