//
//  MBLiveDataViewModel.swift
//  MyBo
//
//  Created by lijingui2010 on 2018/4/14.
//  Copyright © 2018年 MyBar. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class MBLiveDataViewModel: NSObject {
    static var serviceHost = "http://service.ingkee.com/"

    static func handLiveData(urlString: String, success: (@escaping ([MBLiveModel])  -> Void), failure: @escaping ((Error)  -> Void)) {

        let kBaseUrl = "\(serviceHost)/\(urlString)"
        let url = URLRequest(url: URL(string: kBaseUrl)!)
        Alamofire.request(url).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let liveDataModel = MBLiveDataModel(fromJson: JSON(value))
                if liveDataModel.dmError == 0 {
                    success(liveDataModel.lives)
                } else {
                    print("\(value)")
                }
            case .failure(let error):
                failure(error)
            }
        }
        
    }

}
