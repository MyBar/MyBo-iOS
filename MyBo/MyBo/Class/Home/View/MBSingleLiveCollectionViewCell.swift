//
//  MBLiveCollectionViewCell.swift
//  MyBo
//
//  Created by lijingui2010 on 2018/4/14.
//  Copyright © 2018年 MyBar. All rights reserved.
//

import UIKit

class MBLiveCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var portraitImageView: UIImageView!

    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var nickNameLabel: UILabel!

    @IBOutlet weak var onlineUsersLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
