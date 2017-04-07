//
//  LeadPageViewController.swift
//  smallDay
//
//  Created by Mac on 17/3/14.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

public let showMainTabBarController_Notification = "showMainTabBarController_Notification"

class LeadPageViewController: UIViewController {

    let backgroundImage = UIImageView(frame: MainBounds)
    let startBtn = UIButton_Common.noHighLightButton()
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        
        var leadImageName: String?
        switch ScreenWidth {
        case 375: leadImageName = NSBundle.mainBundle().pathForResource("fourpage-375w-667h@2x.jpg", ofType: nil)
        case 414: leadImageName = NSBundle.mainBundle().pathForResource("fourpage-414w-736h@3x.jpg", ofType: nil)
        case 568: leadImageName = NSBundle.mainBundle().pathForResource("fourpage-568h@2x.jpg", ofType: nil)
        default: leadImageName = NSBundle.mainBundle().pathForResource("fourpage@2x.jpg", ofType: nil)
            
        }
        
        
        backgroundImage.image = UIImage(contentsOfFile: leadImageName!)
        self.view.addSubview(backgroundImage)
        
        startBtn.highlighted = false
        startBtn.setTitle("开始小日子", forState: UIControlState.Normal)
        startBtn.setBackgroundImage(UIImage(named: "into_home"), forState: UIControlState.Normal)
        startBtn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        startBtn.frame = CGRectMake((ScreenWidth - 210)*0.5, ScreenHeight - 120, 210, 45)
        startBtn.addTarget(self, action: #selector(LeadPageViewController.showMainBtnClick), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(startBtn)
        
    }
    
    // MARK: - 开始按钮点击事件
    func showMainBtnClick() {
        //使用通知和传值
        NSNotificationCenter.defaultCenter().postNotificationName(showMainTabBarController_Notification, object: nil)

    }

    

}
