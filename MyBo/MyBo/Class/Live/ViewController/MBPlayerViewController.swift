//
//  MBPlayerViewController.swift
//  MyBo
//
//  Created by lijingui2010 on 2018/4/13.
//  Copyright © 2018年 MyBar. All rights reserved.
//

import UIKit

class MBPlayerViewController: MBBaseViewController {

    var url: URL
    var player: IJKFFMoviePlayerController!

    init(url: URL) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        initPlayer()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.player!.prepareToPlay()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        self.player!.shutdown()
    }

    func initPlayer() {
        IJKFFMoviePlayerController.checkIfFFmpegVersionMatch(true)

        let options = IJKFFOptions.byDefault()
        self.player = IJKFFMoviePlayerController(contentURL: self.url, with: options)
        self.player!.view.frame = self.view.bounds
        self.player!.shouldAutoplay = true
        self.view.addSubview(self.player!.view)
    }

}
