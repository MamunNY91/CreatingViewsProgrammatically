//
//  ViewController.swift
//  viewProgrametically
//
//  Created by Abdullah A Mamun on 1/27/17.
//  Copyright © 2017 Abdullah A Mamun. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController,UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.title  = "Home"
        collectionView?.backgroundColor = UIColor.whiteColor()
        collectionView?.registerClass(VideoCell.self, forCellWithReuseIdentifier: "CellId")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CellId", forIndexPath: indexPath)
        
        return cell
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(view.frame.width, 200)
    }

}

class VideoCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    let thumbNailImageView:UIImageView = {
       let imageView = UIImageView()
        imageView.backgroundColor = UIColor.blueColor()
        return imageView
    }()
    func setupViews()  {
     
        addSubview(thumbNailImageView)
        thumbNailImageView.frame = CGRectMake(0, 0, 100, 100)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
