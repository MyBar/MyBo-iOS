//
//  MBConst.swift
//  MyBo
//
//  Created by lijingui2010 on 2018/4/9.
//  Copyright © 2018年 MyBar. All rights reserved.
//

import Foundation

let SCREEN_WIDTH = UIScreen.main.bounds.size.width
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
let IS_IPHONEX_DEVICE = UIScreen.main.currentMode != nil ? __CGSizeEqualToSize(CGSize(width: 1125, height: 2436), UIScreen.main.currentMode!.size): false


func RGBCOLOR(_ red:CGFloat,_ green:CGFloat,_ blue:CGFloat) -> UIColor {
    return UIColor(red: (red)/255.0, green: (green)/255.0, blue: (blue)/255.0, alpha: 1.0)
}

func MBLocalizedString(_ key: String, comment: String = "") -> String {
    return NSLocalizedString(key, comment: comment)
}
