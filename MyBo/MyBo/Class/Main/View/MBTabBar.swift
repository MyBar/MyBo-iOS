//
//  MBTabBar.swift
//  MyBo
//
//  Created by lijingui2010 on 2018/4/9.
//  Copyright © 2018年 MyBar. All rights reserved.
//

import UIKit

@objc public protocol MBTabBarDelegate: UITabBarDelegate {
    @objc optional func tabBar(_ tabBar: UITabBar, didClickLiveButton button: UIButton)
    @objc optional func tabBar(_ tabBar: UITabBar, didLongClickLiveButton button: UIButton)
}

class MBTabBar: UITabBar {

    private var liveButton: UIButton
    private weak var tabBarDelegate: MBTabBarDelegate?

    override init(frame: CGRect) {
        // Add the compose Button to the Center
        self.liveButton = UIButton(type: .custom)
        super.init(frame: frame)

        self.backgroundImage = UIImage(named: "global_tab_bg")
        
        self.liveButton.setImage(UIImage(named: "tab_launch"), for: UIControlState.normal)
        self.liveButton.setImage(UIImage(named: "tab_launch_p"), for: UIControlState.highlighted)
        self.liveButton.sizeToFit()

        self.liveButton.addTarget(self, action: #selector(clickLiveButton(_:)), for: UIControlEvents.touchUpInside)

        self.addSubview(self.liveButton)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func clickLiveButton(_ button: UIButton) {

        if self.tabBarDelegate != nil && self.tabBarDelegate!.responds(to: #selector(MBTabBarDelegate.tabBar(_:didClickLiveButton:))) {
            tabBarDelegate!.tabBar!(self, didClickLiveButton: button)
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        self.tabBarDelegate = self.delegate == nil ? nil : self.delegate as? MBTabBarDelegate

        var yOffset = self.bounds.height >= self.liveButton.height ? 0.0 : (self.liveButton.height - self.frame.height) / 2.0

        if IS_IPHONEX_DEVICE {
            yOffset = self.bounds.height >= self.liveButton.height ? 0.0 : 33.0 //iPhone X的tabbar高度是49，但是底部无效点击区域的高度是33
        }

        self.liveButton.center = CGPoint(x: self.bounds.width / 2.0, y: self.frame.height / 2.0 - yOffset)

        let itemCount = (self.items?.count ?? 0) + 1
        let tabBarItemWidth = self.bounds.width / CGFloat(itemCount)
        var tabBarItemIndex = 0
        let tabBarButtonClass: AnyClass = NSClassFromString("UITabBarButton")!
        for view in self.subviews {
            if view.isKind(of: tabBarButtonClass) {
                let tabBarButton = view as! UIControl
                tabBarButton.frame.size.width = tabBarItemWidth
                tabBarButton.frame.origin.x = tabBarItemWidth * CGFloat(tabBarItemIndex)

                tabBarButton.addTarget(self, action: #selector(tabBarButtonClick(_:)), for: UIControlEvents.touchUpInside)

                tabBarItemIndex += 1

                if tabBarItemIndex == 2 {
                    tabBarItemIndex += 1
                }
            }
        }
    }

    @objc func tabBarButtonClick(_ tabBarButton: UIControl) {
        for imageView in tabBarButton.subviews {
            if imageView.isKind(of: NSClassFromString("UITabBarSwappableImageView")!) {
                //需要实现的帧动画,这里根据需求自定义
                let animation = CAKeyframeAnimation(keyPath: "transform.scale")
                animation.values = [1.0, 1.1, 1.2, 1.3, 1.2, 1.1, 1.0]
                animation.duration = 0.5
                animation.calculationMode = "cubic"
                //把动画添加上去就OK了
                imageView.layer.add(animation, forKey: nil)
            }
        }
    }

}
