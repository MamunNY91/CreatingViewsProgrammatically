//
//  ViewController.swift
//  viewProgrametically
//
//  Created by Abdullah A Mamun on 1/27/17.
//  Copyright © 2017 Abdullah A Mamun. All rights reserved.
//

import UIKit


class HomeController: UICollectionViewController,UICollectionViewDelegateFlowLayout {

    var videos :[Video] = {
        var kanyeChannel = Channel()
        kanyeChannel.name = "KanyeChannel"
        kanyeChannel.profileImageName = "kanye_profile"
       var blankSpaceVideo = Video()
        blankSpaceVideo.title = "Taylor Swift - Blank Space"
        blankSpaceVideo.thumbNailImageName = "taylor_swift_blank_space"
        blankSpaceVideo.channel = kanyeChannel
        blankSpaceVideo.numberOfViews = 234232322
        
        var badBloodVideo = Video()
        badBloodVideo.thumbNailImageName = "taylor_swift_bad_blood"
        badBloodVideo.title = "Taylor Swift - Bad Blood Featuring Kendrick Lamar"
        badBloodVideo.channel = kanyeChannel
        badBloodVideo.numberOfViews = 242452254
        return [blankSpaceVideo,badBloodVideo]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      
        navigationController?.navigationBar.translucent = false
        let titleLable = UILabel(frame: CGRectMake(0,0,view.frame.width - 32,view.frame.height))
        titleLable.text = "Home"
        titleLable.textColor = UIColor.whiteColor()
        titleLable.font = UIFont.systemFontOfSize(20)
        navigationItem.titleView = titleLable
        
            
        collectionView?.backgroundColor = UIColor.whiteColor()
        collectionView?.registerClass(VideoCell.self, forCellWithReuseIdentifier: "CellId")
        // to show the content below menu bar
        collectionView?.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0)
        setMenuBar()
        setNavBarB()
    }
    let menuBar:MenuBar = {
      let mb = MenuBar()
        return mb
    }()
    
    // set up navbar button such as search button
    func setNavBarB()  {
        let searchImage = UIImage(named: "search_icon")?.imageWithRenderingMode(.AlwaysOriginal)
        let searchBarButtonItem = UIBarButtonItem(image: searchImage, style: .Plain, target: self, action: #selector(handleSearch))
        let moreButton = UIImage(named: "nav_more_icon")?.imageWithRenderingMode(.AlwaysOriginal)
        let moreBarButtonItem = UIBarButtonItem(image: moreButton, style: .Plain, target: self, action: #selector(handleMore))
        navigationItem.rightBarButtonItems = [moreBarButtonItem,searchBarButtonItem]
    }
    func handleSearch()  {
        print(123)
    }
    func handleMore()  {
        print(123)
    }

    private func setMenuBar() {
      view.addSubview(menuBar)
        view.addConstraintWithFormat("H:|[v0]|", views: menuBar)
        view.addConstraintWithFormat("V:|[v0(50)]", views: menuBar)
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CellId", forIndexPath: indexPath) as! VideoCell
        cell.video = videos[indexPath.item]
        return cell
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let height = (view.frame.width-32)*9/16
        return CGSizeMake(view.frame.width, height + 104)
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }

}


