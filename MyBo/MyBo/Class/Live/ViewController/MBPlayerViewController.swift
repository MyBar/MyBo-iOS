//
//  MBPlayerViewController.swift
//  MyBo
//
//  Created by lijingui2010 on 2018/4/13.
//  Copyright © 2018年 MyBar. All rights reserved.
//

import UIKit

class MBPlayerViewController: MBBaseViewController {

    var liveModel: MBLiveModel
    var player: IJKFFMoviePlayerController!
    //刚进入时蒙板背影
    var blurImageView: UIImageView!
    lazy var closeButton: UIButton = {
        let image = UIImage(named: "mg_room_btn_close_h")!
        let button = UIButton(type: UIButtonType.custom)
        button.setImage(image, for: UIControlState.normal)
        button.frame = CGRect(x: SCREEN_WIDTH - image.size.width - 10, y: SCREEN_HEIGHT - image.size.height - 10, width: image.size.width, height: image.size.height)
        button.addTarget(self, action: #selector(closeButtonDidClick), for: UIControlEvents.touchUpInside)

        return button
    }()

    lazy var chatContainerVC: MBChatContainerViewController = {
        let chatContainerVC = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "MBChatContainerViewController") as! MBChatContainerViewController

        return chatContainerVC
    }()

    init(liveModel: MBLiveModel) {
        self.liveModel = liveModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        initPlayer()

        initUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.installMovieNotificationObservers()
        self.player!.prepareToPlay()

        let window = (UIApplication.shared.delegate as! MBAppDelegate).window
        window?.addSubview(self.closeButton)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        self.player!.shutdown()
        self.removeMovieNotificationObservers()

        self.closeButton.removeFromSuperview()
    }

    func initPlayer() {
        IJKFFMoviePlayerController.checkIfFFmpegVersionMatch(true)

        let options = IJKFFOptions.byDefault()
        self.player = IJKFFMoviePlayerController(contentURL: URL(string: liveModel.streamAddr)!, with: options)
        self.player!.view.frame = self.view.bounds
        self.player!.shouldAutoplay = true
        self.view.addSubview(self.player!.view)
    }

    func initUI() {
        initBlurImageView()

        addChildViewController()
    }

    func initBlurImageView() {
        self.blurImageView = UIImageView(frame: self.view.bounds)
        self.blurImageView.kf.setImage(with: URL(string: liveModel.creator.portrait), placeholder: UIImage(named: "default_room"))
        self.view.addSubview(self.blurImageView)

        //  创建需要的毛玻璃特效类型
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
        //  毛玻璃view 视图
        let visualEffectView = UIVisualEffectView(effect: blurEffect)
        //添加到要有毛玻璃特效的控件中
        visualEffectView.frame = self.blurImageView.bounds;
        blurImageView.addSubview(visualEffectView)
    }

    func addChildViewController() {
        self.addChildViewController(self.chatContainerVC)
        self.view.addSubview(self.chatContainerVC.view)
        self.chatContainerVC.view.mas_makeConstraints { (make) in
            make?.edges.equalTo()(self.view)
        }
        //self.chatContainerVC.didMove(toParentViewController: self)
    }

    @objc func closeButtonDidClick() {
        self.dismiss(animated: true, completion: nil)
    }

    @objc func loadStateDidChange(notification: Notification) {
        //    MPMovieLoadStateUnknown        = 0,
        //    MPMovieLoadStatePlayable       = 1 << 0,
        //    MPMovieLoadStatePlaythroughOK  = 1 << 1, // Playback will be automatically started in this state when shouldAutoplay is YES
        //    MPMovieLoadStateStalled        = 1 << 2, // Playback will be automatically paused in this state, if started

        let loadState = player.loadState
        if (UInt(loadState.rawValue) & UInt(IJKMPMovieLoadState.playthroughOK.rawValue)) != 0 {
            NSLog("loadStateDidChange: IJKMPMovieLoadStatePlaythroughOK: %d", UInt(loadState.rawValue))
        } else if (UInt(loadState.rawValue) & UInt(IJKMPMovieLoadState.stalled.rawValue)) != 0 {
            NSLog("loadStateDidChange: IJKMPMovieLoadStateStalled: %d", UInt(loadState.rawValue))
        } else {
            NSLog("loadStateDidChange: ???: %d", UInt(loadState.rawValue))
        }
    }

    @objc func moviePlayBackDidFinish(notification: Notification) {
        //    MPMovieFinishReasonPlaybackEnded,
        //    MPMovieFinishReasonPlaybackError,
        //    MPMovieFinishReasonUserExited

        let reason = IJKMPMovieFinishReason(rawValue: notification.userInfo![IJKMPMoviePlayerPlaybackDidFinishReasonUserInfoKey] as! Int)!
        switch reason {
        case IJKMPMovieFinishReason.playbackEnded:
            print("playbackStateDidChange: IJKMPMovieFinishReasonPlaybackEnded: %@\n", reason)
        case IJKMPMovieFinishReason.userExited:
            print("playbackStateDidChange: IJKMPMovieFinishReasonUserExited: %@\n", reason)
        case IJKMPMovieFinishReason.playbackError:
            print("playbackStateDidChange: IJKMPMovieFinishReasonPlaybackError: %@\n", reason)
        }
    }

    @objc func mediaIsPreparedToPlayDidChange(notification: Notification) {
        NSLog("mediaIsPreparedToPlayDidChange\n")
    }

    @objc func moviePlayBackStateDidChange(notification: Notification) {
        //    MPMoviePlaybackStateStopped,
        //    MPMoviePlaybackStatePlaying,
        //    MPMoviePlaybackStatePaused,
        //    MPMoviePlaybackStateInterrupted,
        //    MPMoviePlaybackStateSeekingForward,
        //    MPMoviePlaybackStateSeekingBackward

        switch (player.playbackState) {
        case IJKMPMoviePlaybackState.stopped:
            print("IJKMPMoviePlayBackStateDidChange %@: stoped", player.playbackState)

        case IJKMPMoviePlaybackState.playing:
            print("IJKMPMoviePlayBackStateDidChange %@: playing", player.playbackState)

        case IJKMPMoviePlaybackState.paused:
            print("IJKMPMoviePlayBackStateDidChange %@: paused", player.playbackState)

        case IJKMPMoviePlaybackState.interrupted:
            print("IJKMPMoviePlayBackStateDidChange %@: interrupted", player.playbackState)

        case IJKMPMoviePlaybackState.seekingForward, IJKMPMoviePlaybackState.seekingBackward:
            print("IJKMPMoviePlayBackStateDidChange %@: seeking", player.playbackState)
        }

        self.blurImageView.isHidden = true
        self.blurImageView.removeFromSuperview()
    }

    //pragma mark Install Movie Notifications
    /* Register observers for the various movie object notifications. */
    func installMovieNotificationObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(loadStateDidChange(notification:)), name: NSNotification.Name.IJKMPMoviePlayerLoadStateDidChange, object: player)

        NotificationCenter.default.addObserver(self, selector: #selector(moviePlayBackDidFinish(notification:)), name: NSNotification.Name.IJKMPMoviePlayerPlaybackDidFinish, object: player)

        NotificationCenter.default.addObserver(self, selector: #selector(mediaIsPreparedToPlayDidChange(notification:)), name: NSNotification.Name.IJKMPMediaPlaybackIsPreparedToPlayDidChange, object: player)

        NotificationCenter.default.addObserver(self, selector: #selector(moviePlayBackStateDidChange(notification:)), name: NSNotification.Name.IJKMPMoviePlayerPlaybackStateDidChange, object: player)
    }

    //pragma mark Remove Movie Notification Handlers
    /* Remove the movie notification observers from the movie object. */
    func removeMovieNotificationObservers() {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.IJKMPMoviePlayerLoadStateDidChange, object: player)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.IJKMPMoviePlayerPlaybackDidFinish, object: player)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.IJKMPMediaPlaybackIsPreparedToPlayDidChange, object: player)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.IJKMPMoviePlayerPlaybackStateDidChange, object: player)
    }
}
