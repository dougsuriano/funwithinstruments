//
//  HTPhotoItemGenerator.swift
//  ScrollingPerformance
//
//  Created by Doug Suriano on 4/2/16.
//  Copyright © 2016 Hotel Tonight. All rights reserved.
//

import UIKit

class HTPhotoItemGenerator: NSObject
{
    static let kNumberOfItems = 100
    
    class func generatePhotoItems(completion: (photoItems: Array<HTPhotoItem>) -> Void)
    {
        
        var images = [HTPhotoItem]()
        
        for i in 1...kNumberOfItems
        {
            let imageNumber = String(i)
            let imageName = "cat\(imageNumber)"
            let image = UIImage(named: imageName)
            let imageHeight = image?.size.height
            
            let starRanking = arc4random_uniform(10) + 1
            
            let photoItem = HTPhotoItem(photoName: imageName, imageHeight: Float(imageHeight!), numberOfStars: Int(starRanking), date: NSDate())
            images.append(photoItem)
        }
        
        completion(photoItems: images)
    }
}
