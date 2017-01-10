//
//  FirstVC.swift
//  RaindropsDemo
//
//  Created by bach on 2017/1/10.
//  Copyright © 2017年 bach. All rights reserved.
//

import UIKit

class FirstView: UIView {
    var customTabBar: RdCustomTabBar!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func loadUI() {
        self.backgroundColor = UIColor(red: 1.00, green: 0.00, blue: 0.00, alpha: 1.00)

        customTabBar = RdCustomTabBar()
        customTabBar.backgroundColor = UIColor(red: 0.29, green: 0.71, blue: 0.93, alpha: 1.00)
        customTabBar.selectedIndex = 0
        self.addSubview(customTabBar)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let bounds = self.bounds
        
        let tabBarFrame = CGRect(x: 0, y: bounds.size.height - 49, width: bounds.size.width, height: 49)
        customTabBar.frame = tabBarFrame
    }
}

class FirstVC: UIViewController, TabBarDataSource, TabBarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadUI()
    }
    
    private func loadUI() {
        let firstView = FirstView(frame: self.view.frame)
        firstView.customTabBar.notificationsName = NotificationNames
        firstView.customTabBar.datasource = self
        firstView.customTabBar.delegate = self
        self.view = firstView
    }
    
    func tabBar(_ tabBar: RdCustomTabBar, cellForItemAt index: Int) -> RdCustomBarItem {
        let item = RdCustomBarItem(style: CustomBarItemStyle.Default)
        item.titleLabel.text = TabBarModuleNames[index]
        item.titleLabel.textColor = UIColor.black
        item.imageView.image = UIImage(named: "index_\(index)_normal")
        item.imageView.highlightedImage = UIImage(named: "index_\(index)_selected")
        return item
    }
    
    func tabBarInsetsOfTop(_ tabBar: RdCustomTabBar, cellForItemAt index: Int) -> CGFloat {
        return 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
