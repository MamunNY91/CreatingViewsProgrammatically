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
    }
    let menuBar:MenuBar = {
      let mb = MenuBar()
        return mb
    }()
    

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
        return 5
    }
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CellId", forIndexPath: indexPath)
        
        return cell
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let height = (view.frame.width-32)*9/16
        return CGSizeMake(view.frame.width, height + 84)
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }

}


