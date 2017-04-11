//
//  Views.swift
//  viewProgrametically
//
//  Created by Abdullah A Mamun on 2/13/17.
//  Copyright © 2017 Abdullah A Mamun. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
  override  init(frame: CGRect) {
        super.init(frame: frame)
    setupViews()
    }
    func setupViews()  {
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class VideoCell: BaseCell {
    var video:Video? {
    
        didSet {
            titleLabel.text = video?.title
            setupThumbnailImage()
            setupProfileImage()
            
            
            if let channelName = video?.channel?.name,numberOfViews = video?.numberOfViews {
                let numberFormatter = NSNumberFormatter()
                numberFormatter.numberStyle = .DecimalStyle
                let subtitleText = "\(channelName) • \(numberFormatter.stringFromNumber(numberOfViews)!) • 2 years ago"
                subtitleTextView.text = subtitleText
            }
            //measure title text
            if let title = video?.title {
                let size = CGSizeMake(frame.width-16-44-16-8, 1000)
                let option = NSStringDrawingOptions.UsesFontLeading.union(.UsesLineFragmentOrigin)
                let estimatedRect = NSString(string: title).boundingRectWithSize(size, options: option, attributes: [NSFontAttributeName:UIFont.systemFontOfSize(14)], context: nil)
                if estimatedRect.size.height > 20 {
                    titleLabelConstraint?.constant = 44
                }
                else{
                  titleLabelConstraint?.constant = 20
                }
            }
        }
    }
    func setupProfileImage()  {
        if let profileImageUrl = video?.channel?.profileImageName {
           userProfileImageView.loadImageUsingUrlString(profileImageUrl)
            
        }
    }
    
    func setupThumbnailImage(){
        if let thumbnailImageUrl = video?.thumbNailImageName {
             thumbNailImageView.loadImageUsingUrlString(thumbnailImageUrl)
        }
    }
        
    let thumbNailImageView:CustomImageView = {
        let imageView = CustomImageView()
        
        imageView.image = UIImage(named: "taylor_swift_blank_space")
        imageView.contentMode = .ScaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    let seperatorView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        
        return view
    }()
    var userProfileImageView :CustomImageView = {
        let imageView = CustomImageView()
        
        imageView.image = UIImage(named: "taylor_swift_profile")
        imageView.layer.cornerRadius = 22 // it should be half of the actual height
        imageView.layer.masksToBounds = true
        imageView.contentMode = .ScaleAspectFill
        return imageView
    }()
    let titleLabel:UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Taylor Swift-Blank Space"
        label.numberOfLines = 2
        return label
    }()
    let subtitleTextView:UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "TaylorSwiftVevo • 16,272,675,786 views • 2 years ago"
        textView.textContainerInset = UIEdgeInsetsMake(0, -4, 0, 0)
        textView.textColor = UIColor.lightGrayColor()
        return textView
    }()
    var titleLabelConstraint:NSLayoutConstraint?
    
    override func setupViews()  {
        super.setupViews()
        
        addSubview(thumbNailImageView)
        addSubview(seperatorView)
        addSubview(userProfileImageView)
        addSubview(titleLabel)
        addSubview(subtitleTextView)
        
        addConstraintWithFormat("H:|-16-[v0]-16-|", views: thumbNailImageView)
        addConstraintWithFormat("H:|-16-[v0(44)]", views: userProfileImageView)
        
        //Verticle Constraint
        addConstraintWithFormat("V:|-16-[v0]-8-[v1(44)]-36-[v2(1)]|", views: thumbNailImageView,userProfileImageView ,seperatorView)
        addConstraintWithFormat("H:|[v0]|", views: seperatorView)
        
        //top constraint
        addConstraint(NSLayoutConstraint.init(item: titleLabel, attribute: .Top, relatedBy: .Equal, toItem: thumbNailImageView, attribute: .Bottom, multiplier: 1, constant: 8))
        //left constraint
        addConstraint(NSLayoutConstraint.init(item: titleLabel, attribute: .Left, relatedBy: .Equal, toItem:userProfileImageView , attribute: .Right, multiplier: 1, constant: 8))
        //right constraint
        addConstraint(NSLayoutConstraint.init(item: titleLabel, attribute: .Right, relatedBy: .Equal, toItem: thumbNailImageView, attribute: .Right, multiplier: 1, constant: 0))
        //height constraint
        titleLabelConstraint = NSLayoutConstraint.init(item: titleLabel, attribute: .Height, relatedBy: .Equal, toItem: self, attribute: .Height, multiplier: 0, constant: 44)
        addConstraint(titleLabelConstraint!)
        //addConstraintWithFormat("V:[v0(20)]", views: titleLabel)
        
        //top constraint  for subtitleTextView
        
        addConstraint(NSLayoutConstraint.init(item: subtitleTextView, attribute: .Top, relatedBy: .Equal, toItem: titleLabel, attribute: .Bottom, multiplier: 1, constant: 4))
        //left constraint
        addConstraint(NSLayoutConstraint.init(item: subtitleTextView, attribute: .Left, relatedBy: .Equal, toItem:userProfileImageView , attribute: .Right, multiplier: 1, constant: 8))
        //right constraint
        addConstraint(NSLayoutConstraint.init(item: subtitleTextView, attribute: .Right, relatedBy: .Equal, toItem: titleLabel, attribute: .Right, multiplier: 1, constant: 0))
        //height constraint
        addConstraint(NSLayoutConstraint.init(item: subtitleTextView, attribute: .Height, relatedBy: .Equal, toItem: self, attribute: .Height, multiplier: 0, constant: 30))
        
        
        
    }
    
    
}

