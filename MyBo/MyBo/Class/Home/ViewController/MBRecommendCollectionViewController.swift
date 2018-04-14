//
//  MBRecommendCollectionViewController.swift
//  MyBo
//
//  Created by lijingui2010 on 2018/4/14.
//  Copyright © 2018年 MyBar. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher

private let reuseIdentifier = "MBCollectionViewCell"

class MBRecommendViewController: MBBaseViewController {
    var collectionView: UICollectionView?
    var liveModelList: [MBLiveModel]?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.lightGray

        initCollectionView()

        // Register cell classes
        self.collectionView?.register(UINib(nibName: "MBCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)

        MBLiveDataViewModel.handLiveData(urlString: titleURLModel!.urlString, success: { (liveModelList) in
            self.liveModelList = liveModelList
            self.collectionView?.reloadData()
        }) { (error) in
            print(error)
        }
    }

    func initCollectionView() {
        //此处必须要有创见一个UICollectionViewFlowLayout的对象
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (self.view.frame.width - 21.0) / 2.0, height: (self.view.frame.width - 21.0) / 2.0)
        layout.sectionInset = UIEdgeInsets(top: 7.0, left: 7.0, bottom: 7.0, right: 7.0)
        //同一行相邻两个cell的最小间距
        layout.minimumInteritemSpacing = 7.0
        //最小两行之间的间距
        layout.minimumLineSpacing = 7.0

        self.collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height), collectionViewLayout: layout)
        self.collectionView?.alwaysBounceVertical = true
        self.collectionView?.backgroundColor = self.view.backgroundColor
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self

        self.view.addSubview(self.collectionView!)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension MBRecommendViewController: UICollectionViewDataSource {
    // MARK: UICollectionViewDataSource

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return self.liveModelList?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MBCollectionViewCell

        if let liveModel = self.liveModelList?[indexPath.row] {
            cell.portraitImageView.kf.setImage(with: URL(string: liveModel.creator.portrait))
            cell.cityLabel.text = liveModel.city
            cell.nickNameLabel.text = liveModel.creator.nick
            cell.onlineUsersLabel.text = "\(liveModel.onlineUsers.description)在看"
        }

        return cell
    }
}

extension MBRecommendViewController: UICollectionViewDelegate {
    // MARK: UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let liveModel = self.liveModelList?[indexPath.row] {
            let playerVC = MBPlayerViewController(url: URL(string: liveModel.streamAddr)!)
            self.navigationController?.pushViewController(playerVC, animated: true)
        }
    }
}
