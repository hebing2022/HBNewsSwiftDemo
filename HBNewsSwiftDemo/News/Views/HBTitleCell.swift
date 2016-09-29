//
//  HBTitleCell.swift
//  HBNews
//
//  Created by hebing on 16/9/28.
//  Copyright © 2016年 hebing. All rights reserved.
//

import Foundation
import UIKit

class HBTitleCell: UICollectionViewCell {
    
    var titleLabel = UILabel()
    
    var model: TitleModel?
    {
        didSet
        {
            titleLabel.text = model?.title
            titleLabel.textColor = model?.isSelected == true ? UIColor.red : UIColor.black
            titleLabel.font = model?.isSelected == true ? UIFont.systemFont(ofSize: 17) : UIFont.systemFont(ofSize: 14)
        }
    }

    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        titleLabel.frame = CGRect.init(x: 0, y: 0, width: 80, height: 40)
        titleLabel.textAlignment = NSTextAlignment.center
        titleLabel.textColor = UIColor.black
        self.contentView.addSubview(titleLabel)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
