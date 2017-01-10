//
//  RdCustomTabBar.swift
//  RaindropsDemo
//
//  Created by bach on 2017/1/9.
//  Copyright © 2017年 bach. All rights reserved.
//

import UIKit

protocol TabBarDataSource: NSObjectProtocol {
    func tabBar(_ tabBar: RdCustomTabBar, cellForItemAt index: Int) -> RdCustomBarItem
}

protocol TabBarDelegate: NSObjectProtocol {
    func tabBarInsetsOfTop(_ tabBar: RdCustomTabBar, cellForItemAt index:Int) -> CGFloat
}

class RdCustomTabBar: UIView {

    var datasource: TabBarDataSource!
    var delegate: TabBarDelegate!
    
    var selectedIndex: Int? = nil
    var notificationsName: [String]!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        for v in self.subviews as [UIView] {
            v.removeFromSuperview()
        }
        
        let numbers = notificationsName.count

        let bounds = self.bounds
        let width = bounds.size.width/CGFloat(numbers)
        let height = bounds.size.height
        
        for i in 0..<numbers {
            let tabBarItem = datasource.tabBar(self, cellForItemAt: i)
            let top = delegate.tabBarInsetsOfTop(self, cellForItemAt: i)
            tabBarItem.frame = CGRect(x: CGFloat(i)*width, y: top, width: width, height: height - top)
            self.addSubview(tabBarItem)
            
            if let index = selectedIndex {
                if index == i {
                    tabBarItem.titleLabel.isHighlighted = true
                    tabBarItem.imageView.isHighlighted = true
                }
            }
            
            let button = UIButton(type: UIButtonType.custom)
            button.frame = CGRect(x: 0, y: 0, width: width, height: tabBarItem.frame.size.height)
            button.tag = i
            button.backgroundColor = UIColor.clear
            button.addTarget(self, action: #selector(buttonTouchUpInside(sender:)), for: UIControlEvents.touchUpInside)
            tabBarItem.addSubview(button)
        }
    }
    
    func buttonTouchUpInside(sender: UIButton) {
        if  let index = selectedIndex {
            if index == sender.tag {
                return
            }
            if index >= 0 && index < notificationsName.count {
                NotificationCenter.default.post(name: NSNotification.Name(notificationsName[sender.tag]), object: nil)
            }
        }
    }
}
