//
//  ViewController.swift
//  viewProgrametically
//
//  Created by Abdullah A Mamun on 1/27/17.
//  Copyright © 2017 Abdullah A Mamun. All rights reserved.
//

import UIKit


class HomeController: UICollectionViewController,UICollectionViewDelegateFlowLayout {

//    var videos :[Video] = {
//        var kanyeChannel = Channel()
//        kanyeChannel.name = "KanyeChannel"
//        kanyeChannel.profileImageName = "kanye_profile"
//       var blankSpaceVideo = Video()
//        blankSpaceVideo.title = "Taylor Swift - Blank Space"
//        blankSpaceVideo.thumbNailImageName = "taylor_swift_blank_space"
//        blankSpaceVideo.channel = kanyeChannel
//        blankSpaceVideo.numberOfViews = 234232322
//        
//        var badBloodVideo = Video()
//        badBloodVideo.thumbNailImageName = "taylor_swift_bad_blood"
//        badBloodVideo.title = "Taylor Swift - Bad Blood Featuring Kendrick Lamar"
//        badBloodVideo.channel = kanyeChannel
//        badBloodVideo.numberOfViews = 242452254
//        return [blankSpaceVideo,badBloodVideo]
//    }()
    var videos :[Video]?
    
    func fetchVideos()  {
        let url = NSURL(string: "https://s3-us-west-2.amazonaws.com/youtubeassets/home.json")
        NSURLSession.sharedSession().dataTaskWithURL(url!) { (data, response, error) in
            if error != nil {
              print(error)
                return
            }
            
            do {
              let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers)
                self.videos = [Video]()
                
                for dict in json  as! [[String:AnyObject]] {
                    
                 let video = Video()
                    video.title = dict["title"] as? String
                    video.thumbNailImageName = dict ["thumbnail_image_name"] as? String
                    let chanelDict = dict["channel"] as! [String :AnyObject]
                    let chanel = Channel()
                    chanel.name = chanelDict["name"] as? String
                    chanel.profileImageName = chanelDict["profile_image_name"] as? String
                    
                    self.videos?.append(video)
                    video.channel = chanel
                }
                self.collectionView?.reloadData()
            }catch let jsonError {
                print(jsonError)
            }
        }.resume()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        fetchVideos()
      
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
//        if let count = videos?.count {
//            return count
//        }
//        return 0
        // with single line
        
        return videos?.count ?? 0
    }
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CellId", forIndexPath: indexPath) as! VideoCell
        cell.video = videos?[indexPath.item]
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


