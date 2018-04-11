//
//  MBHomeViewController.swift
//  MyBo
//
//  Created by lijingui2010 on 2018/4/10.
//  Copyright © 2018年 MyBar. All rights reserved.
//

import UIKit

class MBHomeViewController: MBBaseViewController {

    @IBOutlet weak var contentScrollView: UIScrollView!

    lazy var homeNavTitleView: MBHomeNavTitleView = {
        let homeNavTitleView =  MBHomeNavTitleView(frame: CGRect(x: 0, y: 0, width: 300, height: 44), titleArray: titleURLArray)
        homeNavTitleView.delegate = self
        return homeNavTitleView
    }()

    lazy var titleURLArray: Array<Dictionary<String, String>> = {
        var arrayList = NSArray(contentsOfFile: Bundle.main.path(forResource: "TitleURLs.plist", ofType: nil)!)!
        return arrayList as! Array<Dictionary<String, String>>
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
        initUI()
    }

    func initUI() {
        setupNav()
        addChildViewControllers()

        let contentX = CGFloat(self.titleURLArray.count) * SCREEN_WIDTH
        self.contentScrollView.contentSize = CGSize(width: contentX, height: 0)
        self.contentScrollView.isPagingEnabled = true
        // 添加默认控制器
        let currentIndex = self.childViewControllers.count < 3 ? 0 : 1
        self.contentScrollView.contentOffset = CGPoint(x: CGFloat(currentIndex) * SCREEN_WIDTH, y: 0)
        self.scrollViewDidEndScrollingAnimation(self.contentScrollView)
    }

    func setupNav() {
        self.navigationItem.titleView = self.homeNavTitleView

        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "global_search"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(search))

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "title_button_more"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(search))
    }

    func addChildViewControllers() {
        for item in titleURLArray {
            let classType: AnyClass = NSClassFromString("MyBo." + item["viewController"]!)!
            let objecType : MBBaseViewController.Type = classType as! MBBaseViewController.Type
            let viewController: MBBaseViewController = objecType.init()
            viewController.title = item["title"]
            self.addChildViewController(viewController)
        }
    }

    @objc func search() {

    }

}

extension MBHomeViewController: UIScrollViewDelegate {
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        let index = Int(scrollView.contentOffset.x / scrollView.frame.width)
        let vc = self.childViewControllers[index]

        self.homeNavTitleView.scrollTo(index)

        if vc.isViewLoaded {
            return
        }

        vc.view.frame = CGRect(x: CGFloat(index) * SCREEN_WIDTH, y: 0, width: SCREEN_WIDTH, height: scrollView.frame.height)
        scrollView.addSubview(vc.view)
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.scrollViewDidEndScrollingAnimation(scrollView)
    }
}

extension MBHomeViewController: MBHomeNavTitleViewDelegate {
    func homeNavTitleView(_ homeNavTitleView: MBHomeNavTitleView, didSelectAt index: Int) {
        let contentOffset = CGPoint(x: self.contentScrollView.frame.width * CGFloat(index), y: 0)
        self.contentScrollView.setContentOffset(contentOffset, animated: true)
    }
}
