//
//  UIButton+Common.swift
//  smallDay
//
//  Created by Mac on 17/3/14.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

class UIButton_Common: NSObject {
    
    //设置没有高亮状态的按钮
    class noHighLightButton: UIButton {
        //重写setFrame方法
        override var highlighted: Bool {
            didSet {
                super.highlighted = false
            }
        }
    }
    
}
