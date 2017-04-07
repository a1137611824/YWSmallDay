//
//  YWMainTabBarController.swift
//  smallDay
//
//  Created by Mac on 2017/4/6.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

class YWMainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupAllChildViewController()
    }
    
    func setupAllChildViewController() {
        tabBarAddChildViewController(YWExploreViewController(), title: "探店", imageName: "recommendation_1", selectedImageName: "recommendation_2")
        tabBarAddChildViewController(YWExperienceViewController(), title: "体验", imageName: "broadwood_1", selectedImageName: "broadwood_2")
        tabBarAddChildViewController(YWClassifyViewController(), title: "分类", imageName: "classification_1", selectedImageName: "classification_2")
        tabBarAddChildViewController(YWMineViewController(), title: "我的", imageName: "my_1", selectedImageName: "my_2")
    }
    
    func tabBarAddChildViewController(vc: UIViewController, title: String, imageName: String, selectedImageName: String) {
        
        vc.tabBarItem = UITabBarItem(title: title, image: UIImage(named: imageName), selectedImage: UIImage(named: selectedImageName))
        vc.view.backgroundColor = YWBackgroundcolor
        self.tabBar.tintColor = UIColor.blackColor()
        let nav = UINavigationController(rootViewController: vc)
        addChildViewController(nav)
    }

   

}



