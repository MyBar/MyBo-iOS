//
//  MBPresentationController.swift
//  MyBo
//
//  Created by lijingui2010 on 2018/4/12.
//  Copyright © 2018年 MyBar. All rights reserved.
//

import UIKit

class MBPresentationController: UIPresentationController {

    lazy var visualEffectView: UIVisualEffectView = {
        //使用UIVisualEffectView实现模糊效果
        let blur = UIBlurEffect(style: .light)
        let visualEffectView = UIVisualEffectView(effect: blur)
        visualEffectView.frame = (self.containerView?.bounds)!
        visualEffectView.alpha = 0.2
        visualEffectView.backgroundColor = UIColor.black
        return visualEffectView
    }()

    // value to control height of bottom view
    public var presentedViewHeight: CGFloat

    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        //get height from an objec of PresentBottomVC class
        if case let vc as MBPresentedViewController = presentedViewController {
            presentedViewHeight = vc.presentedViewHeight ?? UIScreen.main.bounds.height
        } else {
            presentedViewHeight = UIScreen.main.bounds.width
        }

        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
    }

    //presentationTransitionWillBegin 是在呈现过渡即将开始的时候被调用的。我们在这个方法中把半透明黑色背景 View 加入到 containerView 中，并且做一个 alpha 从0到1的渐变过渡动画。
    override func presentationTransitionWillBegin() {

        self.containerView?.addSubview(self.visualEffectView)
    }

    //presentationTransitionDidEnd: 是在呈现过渡结束时被调用的，并且该方法提供一个布尔变量来判断过渡效果是否完成。在我们的例子中，我们可以使用它在过渡效果已结束但没有完成时移除半透明的黑色背景 View。
    override func presentationTransitionDidEnd(_ completed: Bool) {
        // 如果呈现没有完成，那就移除背景 View
        if completed == false {
            self.visualEffectView.removeFromSuperview()
        }
    }

    //以上就涵盖了我们的背景 View 的呈现部分，我们现在需要给它添加淡出动画并且在它消失后移除它。正如你预料的那样，dismissalTransitionWillBegin 正是我们把它的 alpha 重新设回0的地方。
    override func dismissalTransitionWillBegin() {
        self.visualEffectView.alpha = 0.0
    }

    //我们还需要在消失完成后移除背景 View。做法与上面 presentationTransitionDidEnd: 类似，我们重载 dismissalTransitionDidEnd: 方法
    override func dismissalTransitionDidEnd(_ completed: Bool) {
        if completed {
            self.visualEffectView.removeFromSuperview()
        }
    }

    override var frameOfPresentedViewInContainerView: CGRect {
        return CGRect(x: 0, y: UIScreen.main.bounds.height - presentedViewHeight, width: UIScreen.main.bounds.width, height: presentedViewHeight)
    }
}
