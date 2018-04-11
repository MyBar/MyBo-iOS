//
//  MBHomeNavTitleView.swift
//  MyBo
//
//  Created by lijingui2010 on 2018/4/11.
//  Copyright © 2018年 MyBar. All rights reserved.
//

import UIKit

@objc protocol MBHomeNavTitleViewDelegate: NSObjectProtocol {
    @objc func homeNavTitleView(_ homeNavTitleView: MBHomeNavTitleView, didSelectAt index: Int)
}

class MBHomeNavTitleView: UIView {

    private var titleScrollView: UIScrollView!
    private var titleArray: Array<Dictionary<String, String>>!
    private var bottomLineView: UIView!
    private lazy var titleLabelArray: Array<UILabel> = {
        return Array()
    }()
    private var currentTitleLabelIndex = 0
    weak open var delegate: MBHomeNavTitleViewDelegate?

    init(frame: CGRect, titleArray: Array<Dictionary<String, String>>) {
        super.init(frame: frame)

        self.titleScrollView = UIScrollView(frame: frame)
        self.titleScrollView.showsVerticalScrollIndicator = false
        self.titleScrollView.showsHorizontalScrollIndicator = false
        self.titleScrollView.delegate = self
        self.titleArray = titleArray
        self.bottomLineView = UIView()
        addTitleLabels()

        self.addSubview(self.titleScrollView)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addTitleLabels() {
        var margin: CGFloat = 10.0
        let height: CGFloat = self.titleScrollView.frame.height
        var x: CGFloat = margin
        
        for index in 0 ..< titleArray.count {
            let titleLabel = UILabel()
            titleLabel.tag = index
            titleLabel.text = titleArray[index]["title"]
            titleLabel.textColor = UIColor.white
            titleLabel.font = UIFont(name: "HYQiHei", size: 25)
            titleLabel.isUserInteractionEnabled = true

            self.titleLabelArray.append(titleLabel)

            titleLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(titleLabelClick(_:))))

            //根据文本、字体大小计算宽度；以及自适应高度
            var textAttrs = Dictionary<NSAttributedStringKey, Any>()
            textAttrs[NSAttributedStringKey.font] = titleLabel.font
            let text = titleArray[index]["title"]! as NSString
            let textSize = text.boundingRect(with: CGSize(width: CGFloat(MAXFLOAT), height: CGFloat(MAXFLOAT)), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: textAttrs, context: nil).size

            titleLabel.frame = CGRect(x: x, y: self.titleScrollView.centerY - textSize.height / 2.0, width: textSize.width, height: textSize.height)

            if self.titleArray.count == 2 {
                if (index == 0) {
                    // 添加下划线
                    // 下划线宽度 = 按钮文字宽度 - 10
                    // 下划线中心点x = titleLabel中心点x
                    // 位置和尺寸
                    self.bottomLineView.frame = CGRect(x: x, y: titleLabel.frame.origin.y + titleLabel.height + 3.0, width: titleLabel.width - 10.0, height: 2.0)
                    self.bottomLineView.centerX = titleLabel.centerX
                    self.bottomLineView.backgroundColor = UIColor.white

                    self.titleScrollView.addSubview(bottomLineView)

                    self.currentTitleLabelIndex = index
                }
            } else if self.titleArray.count > 3{
                if (index == 1) {
                    // 添加下划线
                    // 下划线宽度 = 按钮文字宽度 - 10
                    // 下划线中心点x = titleLabel中心点x
                    // 位置和尺寸
                    self.bottomLineView.frame = CGRect(x: x, y: titleLabel.frame.origin.y + titleLabel.height + 3.0, width: titleLabel.width - 10.0, height: 2.0)
                    self.bottomLineView.centerX = titleLabel.centerX
                    self.bottomLineView.backgroundColor = UIColor.white

                    self.titleScrollView.addSubview(bottomLineView)

                    self.currentTitleLabelIndex = index
                }
            }

            if (index == self.titleArray.count - 1) {
                margin = 10.0
            } else {
                margin = 20.0
            }
            x += textSize.width + margin

            self.titleScrollView.addSubview(titleLabel)
        }

        self.titleScrollView.contentSize = CGSize(width: x, height: height)
    }

    @objc private func titleLabelClick(_ tap: UITapGestureRecognizer) {
        let currentTitleLabel = tap.view as! UILabel
        if currentTitleLabel.tag == self.currentTitleLabelIndex {
            return
        }

        if let _ = self.delegate?.responds(to: #selector(MBHomeNavTitleViewDelegate.homeNavTitleView(_:didSelectAt:))) {
            self.delegate?.homeNavTitleView(self, didSelectAt: currentTitleLabel.tag)
        }

        self.scrollTo(currentTitleLabel.tag)
    }

    func scrollTo(_ index: Int) {
        let currentTitleLabel = self.titleLabelArray[index]
        self.currentTitleLabelIndex = currentTitleLabel.tag

        UIView.animate(withDuration: 0.3) {
            self.bottomLineView.width = currentTitleLabel.width - 10.0
            self.bottomLineView.centerX = currentTitleLabel.centerX
        }

        //选中的label居中显示
        var offsetX = currentTitleLabel.centerX - self.bounds.width * 0.5
        if offsetX < 0 {
            offsetX = 0
        }

        let maxOffsetX = self.titleScrollView.contentSize.width - self.bounds.width
        if offsetX > maxOffsetX {
            offsetX = maxOffsetX
        }

        self.titleScrollView.setContentOffset(CGPoint(x: offsetX, y: 0), animated: true)
    }
}

extension MBHomeNavTitleView: UIScrollViewDelegate {
    
}
