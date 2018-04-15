//
//  MBChatContainerViewController.swift
//  MyBo
//
//  Created by lijingui2010 on 2018/4/15.
//  Copyright © 2018年 MyBar. All rights reserved.
//

import UIKit

class MBChatContainerViewController: MBBaseViewController {

    @IBOutlet weak var chatScrollView: UIScrollView!

    let childViewControllersName = ["MBNoneChatViewController", "MBLiveChatViewController"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
    }

    func initUI() {
        self.view.backgroundColor = UIColor.clear

        addChildViewController()

        let contentX = CGFloat(self.childViewControllersName.count) * SCREEN_WIDTH
        self.chatScrollView.contentSize = CGSize(width: contentX, height: 0)
        self.chatScrollView.isPagingEnabled = true
        // 添加默认控制器
        let currentIndex = self.childViewControllers.count == 1 ? 0 : 1
        self.chatScrollView.contentOffset = CGPoint(x: CGFloat(currentIndex) * SCREEN_WIDTH, y: 0)
        self.scrollViewDidEndScrollingAnimation(self.chatScrollView)
    }

    func addChildViewController() {
        for index in 0 ..< self.childViewControllersName.count {
            let childVCName = self.childViewControllersName[index]
            let classType: AnyClass = NSClassFromString("MyBo." + childVCName)!
            let objecType : MBBaseViewController.Type = classType as! MBBaseViewController.Type
            let viewController: MBBaseViewController = childVCName != "MBLiveChatViewController" ? objecType.init() : UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "MBLiveChatViewController") as! MBBaseViewController
            self.addChildViewController(viewController)

            viewController.view.frame = CGRect(x: CGFloat(index) * SCREEN_WIDTH, y: 0, width: self.chatScrollView.width, height: self.chatScrollView.frame.height)
            self.chatScrollView.addSubview(viewController.view)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension MBChatContainerViewController: UIScrollViewDelegate {
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {

    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.scrollViewDidEndScrollingAnimation(scrollView)
    }
}
