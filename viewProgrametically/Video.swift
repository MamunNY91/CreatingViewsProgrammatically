//
//  Video.swift
//  viewProgrametically
//
//  Created by Abdullah A Mamun on 2/23/17.
//  Copyright © 2017 Abdullah A Mamun. All rights reserved.
//

import UIKit

class Video: NSObject {
    var thumbNailImageName: String?
    var title:String?
    var channel:Channel?
    var numberOfViews : NSNumber?
    var uploadDate:NSDate?
}

class Channel: NSObject {
    var name:String?
    var profileImageName:String?
}
