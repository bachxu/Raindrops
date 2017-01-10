//
//  CustomUnitBar.swift
//  RaindropsDemo
//
//  Created by bach on 2017/1/6.
//  Copyright © 2017年 bach. All rights reserved.
//

import UIKit

public enum CustomBarItemStyle {
    case Default
}

class RdCustomBarItem: UIView {

    var titleLabel: UILabel!
    var imageView: UIImageView!
    
    public init(style: CustomBarItemStyle) {
        super.init(frame: CGRect.zero)
        loadSubViews()
        setSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func loadSubViews() {
        titleLabel = UILabel()
        self.addSubview(titleLabel)
        
        imageView = UIImageView()
        self.addSubview(imageView)
    }
    
    private func setSubViews() {
        titleLabel.backgroundColor = UIColor.clear
        titleLabel.font = UIFont.systemFont(ofSize: 10.0)
        titleLabel.textAlignment = NSTextAlignment.center
        titleLabel.textColor = UIColor(red: 0.63, green: 0.63, blue: 0.63, alpha: 1.00)
        titleLabel.highlightedTextColor = UIColor.white
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let bounds = self.bounds
        
        let titleLabelFrame = CGRect(x: 0, y: bounds.size.height - 20 - 2, width: bounds.size.width, height: 20)
        titleLabel.frame = titleLabelFrame
        
        imageView.sizeToFit()
        let imageWidth = imageView.frame.width
        let imageHeight = imageView.frame.height
        let imageViewFrame = CGRect(x: (bounds.size.width - imageWidth) / 2, y: 3.0, width: imageWidth, height: imageHeight)
        imageView.frame = imageViewFrame
    }
}
