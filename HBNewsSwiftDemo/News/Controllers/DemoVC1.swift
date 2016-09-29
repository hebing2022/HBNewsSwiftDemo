//
//  DemoVC1.swift
//  HBNewsSwiftDemo
//
//  Created by hebing on 16/9/29.
//  Copyright © 2016年 hebing. All rights reserved.
//

import Foundation
import UIKit

class DemoVC1: HBBaseViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.orange
        
        titleLabel.text = String(describing: self.classForCoder)
    }
    
}
