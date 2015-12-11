//
//  GuidePage.swift
//  Uber
//
//  Created by dengchen on 15/12/10.
//  Copyright © 2015年 name. All rights reserved.
//

import UIKit
import AVFoundation

private let btnMagin = 16;
private let AnimationImageCount = 67

private let btnWidth =
    (ScreenWidth - CGFloat(btnMagin * 3 - 6)) * 0.5
private let btnHeight = 40

private let animationDuration = Double(AnimationImageCount) * 0.1

class GuidePage: DCBasePage {
    
    private let loc = DCLocation()
    
    @objc private func doLogIn() {
        loc.startLocation()
        print("doLogIn")
    }
    
    @objc private func doRegister() {
        
        let regPage =  DCRegisterPage()
        let nav = UINavigationController(rootViewController: regPage)
        
        presentViewController(nav, animated: true) { () -> Void in
            
        }
    }
    
    override func loadView() {
         super.loadView()
        setupUI()
        setVideo()
        startAnimation()
    }


    
    private func setupUI() {
        
        view.addSubview(bgView)
        view.addSubview(ImageView)
        
        bgView.addSubview(loginBtn)
        bgView.addSubview(registerBtn)
        
        ImageView.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(self.view)
        }
        
        bgView.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(self.view)
        }
        
        loginBtn.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(btnMagin)
            make.bottom.equalTo(-btnMagin)
            make.width.equalTo(btnWidth)
            make.height.equalTo(btnHeight)
        }
        
        registerBtn.snp_makeConstraints { (make) -> Void in
            make.right.equalTo(-btnMagin)
            make.bottom.equalTo(-btnMagin)
            make.size.equalTo(loginBtn)
        }
        
        ImageView.hidden = true
        ImageView.image = UIImage(named: "logo-\(AnimationImageCount)")
        
        loginBtn.addTarget(self, action: "doLogIn", forControlEvents: .TouchUpInside)
        registerBtn.addTarget(self, action: "doRegister", forControlEvents: .TouchUpInside)

        
        bgView.alpha = 0
    }
    
    private func startAnimation() {
        
        ImageView.animationImages = imageArray
        ImageView.animationRepeatCount = 1
        ImageView.animationDuration = animationDuration
        ImageView.hidden = false
        ImageView.startAnimating()
        
        UIView.animateWithDuration(animationDuration, delay: 3, options: .CurveEaseOut, animations: { () -> Void in
            
            self.bgView.alpha = 1;
            self.player!.play()
    
            }) { (finshed) -> Void in
            DCLog("animate finshed")
        }
    }
    
    private func setVideo() {
        
        let fileUrl = NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("welcome_video.mp4", ofType: nil)!)
        
        playerItem = AVPlayerItem(URL: fileUrl)
        
        player = AVPlayer(playerItem: playerItem!)
        
        let playerlayer = AVPlayerLayer(player: player!)
        
        playerlayer.frame = view.bounds
        playerlayer.videoGravity = AVLayerVideoGravityResizeAspect
        
        bgView.layer.insertSublayer(playerlayer, atIndex: 0)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "videoDidFinshed:", name: AVPlayerItemDidPlayToEndTimeNotification, object: playerItem)
        
    }
    
    @objc private func videoDidFinshed(sender:NSNotification) {
        
        if let Item = sender.object as? AVPlayerItem  {
            Item.seekToTime(kCMTimeZero)
            player?.play()
        }
        

    }
    
   
    private lazy var imageArray:[UIImage] = {
        
        var imageArray = [UIImage]()

        for var index = 0; index < AnimationImageCount;index++ {

            guard let image = UIImage(named:String(format: "logo-%d", index)) else {
                continue
            }
            imageArray.append(image)
        }
        
        return imageArray
    }()
    
    private var playerItem:AVPlayerItem?
    
    private var player:AVPlayer?
    
    private let ImageView = UIImageView()
    
    private let bgView = UIView()
    
    private let loginBtn = UIButton(title: "登录", bgColor: UIColor.whiteColor(), titleColor: UIColor.lightGrayColor(), fontSize: 18, round: 2.5)
    
    private let registerBtn = UIButton(title: "注册", bgColor: UIColor(red: 33/255, green: 172/255, blue: 204/255, alpha: 1.0), titleColor: UIColor.whiteColor(), fontSize: 18, round: 2.5)
    
}

