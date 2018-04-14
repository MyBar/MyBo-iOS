//
//  MBTitleURLModel.swift
//  MyBo
//
//  Created by lijingui2010 on 2018/4/14.
//  Copyright © 2018年 MyBar. All rights reserved.
//

import UIKit

class MBTitleURLModel: NSObject {
    var title: String!
    var viewController: String!
    var urlString: String!

    init(fromDictionary dic: Dictionary<String, String>) {

        self.title = dic["title"]
        self.viewController = dic["viewController"]
        self.urlString = dic["urlString"]

        super.init()
    }

}
