//
//  Extensions.swift
//  viewProgrametically
//
//  Created by Abdullah A Mamun on 2/13/17.
//  Copyright © 2017 Abdullah A Mamun. All rights reserved.
//

import UIKit

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor{
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}

extension UIView  {
    func addConstraintWithFormat(format:String,views:UIView...)  {
        var viewsDictionary = [String :UIView]()
        for (index,view) in views.enumerate() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
            
        }
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
}

extension UIImageView {
    func loadImageUsingUrlString(urlString:String)  {
        let url = NSURL(string: urlString)
        NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: { (data, response, error) in
            if error != nil{
                print(error)
                return
            }
            dispatch_async(dispatch_get_main_queue(), {
                self.image = UIImage(data: data!)
            })
        }).resume()
    }
}

