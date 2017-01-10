//
//  MainVC.swift
//  RaindropsDemo
//
//  Created by bach on 2017/1/10.
//  Copyright © 2017年 bach. All rights reserved.
//

import UIKit

let NotificationNames: [String] = ["NCFirstModule", "NCSecondModule", "NCThirdModule", "NCForthModule"]
let TabBarModuleNames: [String] = ["first", "second", "third", "forth"]

class MainVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        addObservers()
        NotificationCenter.default.post(name: NSNotification.Name(NotificationNames[0]), object: nil)
    }
    
    private func addObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(firstModule(notification:)), name: NSNotification.Name(NotificationNames[0]), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(secondModule(notification:)), name: NSNotification.Name(NotificationNames[1]), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(thirdModule(notification:)), name: NSNotification.Name(NotificationNames[2]), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(forthModule(notification:)), name: NSNotification.Name(NotificationNames[3]), object: nil)
    }
    
    func firstModule(notification: Notification) {
        let firstVC = FirstVC()
        self.navigationController!.popToRootViewController(animated: false)
        self.navigationController?.pushViewController(firstVC, animated: false)
    }
    
    func secondModule(notification: Notification) {
        let secondVC = SecondVC()
        self.navigationController!.popToRootViewController(animated: false)
        self.navigationController?.pushViewController(secondVC, animated: false)
    }
    
    func thirdModule(notification: Notification) {
        let thirdVC = ThirdVC()
        self.navigationController!.popToRootViewController(animated: false)
        self.navigationController?.pushViewController(thirdVC, animated: false)
    }
    
    func forthModule(notification: Notification) {
        let forthVC = ForthVC()
        self.navigationController!.popToRootViewController(animated: false)
        self.navigationController?.pushViewController(forthVC, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
