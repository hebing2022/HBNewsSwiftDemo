//
//  DemoVC6.swift
//  HBNewsSwiftDemo
//
//  Created by hebing on 16/9/29.
//  Copyright © 2016年 hebing. All rights reserved.
//

import Foundation
import UIKit

class DemoVC6: HBBaseViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.blue
        
        titleLabel.text = String(describing: self.classForCoder)
    }
}
