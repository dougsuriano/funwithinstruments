//
//  HTPhotoItemTableViewCell.swift
//  ScrollingPerformance
//
//  Created by Doug Suriano on 4/2/16.
//  Copyright © 2016 Hotel Tonight. All rights reserved.
//

import UIKit

class HTPhotoItemTableViewCell: UITableViewCell {

    let photoView: UIImageView
    let quoteLabel: UILabel
    let dateLabel: UILabel
    let quoteContainerView: UIView
    var starViews: Array<UIImageView> = []
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        self.photoView = UIImageView()
        
        self.quoteLabel = UILabel()
        self.quoteLabel.numberOfLines = 0
        
        self.dateLabel = UILabel()
        self.dateLabel.textColor = UIColor.whiteColor()
        self.dateLabel.font = UIFont(name: "Avenir-Light", size: 14.0)
        
        self.quoteContainerView = UIView()
        self.quoteContainerView.backgroundColor = UIColor.blackColor()
        
        for _ in 0...10
        {
            let imageView = UIImageView(image: UIImage(named: "star"))
            imageView.hidden = true
            self.starViews.append(imageView)
        }
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(self.quoteContainerView)
        self.contentView.addSubview(self.photoView)
        self.contentView.addSubview(self.quoteLabel)
        self.contentView.addSubview(self.dateLabel)
        
        for imageView in self.starViews
        {
            self.contentView.addSubview(imageView)
        }
    }

    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
        
        self.photoView.frame = CGRect(x: 0.0, y: 0.0, width: self.bounds.size.width, height: self.bounds.size.height - 150.0)
        
        self.quoteContainerView.frame = CGRect(x: 0.0, y: self.photoView.frame.size.height, width: self.bounds.size.width, height: 150.0)
        
        self.quoteLabel.frame = self.quoteContainerView.frame
        
        var xOffset: CGFloat = 10.0
        
        for starView in self.starViews
        {
            starView.frame = CGRectMake(xOffset, 20.0, 15.0, 15.0)
            xOffset = xOffset + 25.0
        }
        
        self.dateLabel.frame = CGRect(x: 10.0, y: 40.0, width: self.bounds.width, height: 14.0)
    }
    
    override func prepareForReuse()
    {
        super.prepareForReuse()
        
        for starView in self.starViews
        {
            starView.hidden = true
        }
        
        self.quoteLabel.alpha = 0.0
        self.photoView.alpha = 1.0
    }
    
    func configure(photoItem: HTPhotoItem)
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), {
            let image = UIImage(named: photoItem.photoName)
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.photoView.image = image
                self.photoView.alpha = 1.0
            })
        })
        
        for i in 0...photoItem.numberOfStars
        {
            self.starViews[i].hidden = false
        }

        self.dateLabel.text = "Sun Apr 03 00:14:09"
        
        self.setNeedsLayout()
    }
}
