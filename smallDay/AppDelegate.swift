//
//  AppDelegate.swift
//  smallDay
//
//  Created by Mac on 17/3/14.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
        
        setKeyValue()
        columnInit()
        
        //传值之后的处理事件
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(AppDelegate.showMianViewController), name: showMainTabBarController_Notification, object: nil)
        
        return true
    }
    
    // MARK: -状态栏初始化
    func columnInit() {
        //在plist设置viewcontroller-base status为no意思是交由uiapplication来管理
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
        UIApplication.sharedApplication().statusBarHidden = false
    }

    
    
    // MARK: - 判断是否进入引导界面
    private func setKeyValue() {
        window = UIWindow(frame: MainBounds)
        window?.rootViewController = showLeadPage()
        window?.makeKeyAndVisible()
    }
    
    
    // MARK: - 引导界面设置
    func showLeadPage() -> UIViewController{

        let versionStr = "CFBundleShortVersionString"
        let currentVersion = NSBundle.mainBundle().infoDictionary![versionStr]
        //取出之前的版本号
        let defaults = NSUserDefaults.standardUserDefaults()
        let oldVersion = defaults.stringForKey(versionStr) ?? ""
        
        //比较当前版本是否在老版本基础上降低了
        if currentVersion?.compare(oldVersion) == NSComparisonResult.OrderedDescending {
            //将新的版本号存入手机
            defaults.setObject(currentVersion, forKey: versionStr)
            //将数据同步到文件当中，避免丢失
            defaults.synchronize()
            return LeadPageViewController()
        }
        return YWMainTabBarController()

    }
    
    //进入首页面
    func showMianViewController() {
        let mainTabBarVC = YWMainTabBarController()
        self.window!.rootViewController = mainTabBarVC
        //设置首页面导航栏格式
//        let nav = mainTabBarVC.viewControllers![0] as? MainNavigationController
//        (nav?.viewControllers[0] as! MainViewController).pushcityView()
    }
    

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

