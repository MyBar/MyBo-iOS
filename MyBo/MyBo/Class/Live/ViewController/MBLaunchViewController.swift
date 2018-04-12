//
//  MBLaunchViewController.swift
//  MyBo
//
//  Created by lijingui2010 on 2018/4/12.
//  Copyright © 2018年 MyBar. All rights reserved.
//

import UIKit

class MBLaunchViewController: MBPresentedViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func closeButtonClick(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}
