//
//  MBBaseViewController.swift
//  MyBo
//
//  Created by lijingui2010 on 2018/4/10.
//  Copyright © 2018年 MyBar. All rights reserved.
//

import UIKit

class MBBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let color = RGBCOLOR(CGFloat(arc4random() % 255), CGFloat(arc4random() % 255), CGFloat(arc4random() % 255))

        self.view.backgroundColor = color
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
