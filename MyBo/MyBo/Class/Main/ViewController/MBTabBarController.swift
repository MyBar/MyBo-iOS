//
//  MBTabBarController.swift
//  MyBo
//
//  Created by lijingui2010 on 2018/4/9.
//  Copyright © 2018年 MyBar. All rights reserved.
//

import UIKit

class MBTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let homeVC = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "MBHomeViewController")
        self.addChildViewController(homeVC, title: MBLocalizedString("首页"), imageName: "tab_live", selectedImageName: "tab_live_p")

        let locationVC = MBLocationViewController()
        self.addChildViewController(locationVC, title: MBLocalizedString("附近"), imageName: "tab_me", selectedImageName: "tab_me_p")

        let focusVC = MBFocusViewController()
        self.addChildViewController(focusVC, title: MBLocalizedString("关注"), imageName: "tab_live", selectedImageName: "tab_live_p")

        let profileVC = MBProfileViewController()
        self.addChildViewController(profileVC, title: MBLocalizedString("我"), imageName: "tab_me", selectedImageName: "tab_me_p")

        let tabBar = MBTabBar()
        self.setValue(tabBar, forKeyPath: "tabBar")
    }

    /**
     *  添加一个子控制器
     *
     *  @param childVc       子控制器
     *  @param title         标题
     *  @param image         图片
     *  @param selectedImage 选中的图片
     */
    func addChildViewController(_ childController: UIViewController, title: String, imageName: String, selectedImageName: String) {

        childController.tabBarItem.title = title

        childController.tabBarItem.image = UIImage(named: imageName)?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        childController.tabBarItem.selectedImage = UIImage(named: selectedImageName)?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)

        // 设置文字的样式
        var textAttrs = Dictionary<NSAttributedStringKey, Any>()
        textAttrs[NSAttributedStringKey.foregroundColor] = RGBCOLOR(123.0, 123.0, 123.0)
        childController.tabBarItem.setTitleTextAttributes(textAttrs, for: UIControlState.normal)

        var selectTextAttrs = Dictionary<NSAttributedStringKey, Any>()
        selectTextAttrs[NSAttributedStringKey.foregroundColor] = RGBCOLOR(12.0, 12.0, 12.0)
        childController.tabBarItem.setTitleTextAttributes(selectTextAttrs, for: UIControlState.selected)

        let navVC = MBNavigationController(rootViewController: childController)
        self.addChildViewController(navVC)
    }
}

extension MBTabBarController: MBTabBarDelegate {
    func tabBar(_ tabBar: UITabBar, didClickLiveButton button: UIButton) {
        let launchVC = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "MBLaunchViewController") as! MBLaunchViewController
        launchVC.modalPresentationStyle = .custom
        launchVC.presentedViewHeight = 300.0
        launchVC.transitioningDelegate = self
        self.present(launchVC, animated: true, completion: nil)
    }
}

extension MBTabBarController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {

        return MBPresentationController(presentedViewController: presented, presenting: presenting)
    }
}
