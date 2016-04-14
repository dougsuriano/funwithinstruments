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
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(self.quoteContainerView)
        self.contentView.addSubview(self.photoView)
        self.contentView.addSubview(self.quoteLabel)
        self.contentView.addSubview(self.dateLabel)
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
        
        self.dateLabel.frame = CGRect(x: 10.0, y: 40.0, width: 0.0, height: 0.0)
        self.dateLabel.sizeToFit()
        
        for view in self.contentView.subviews
        {
            if view.tag == 666
            {
                view.frame = self.photoView.frame
            }
        }
    }
    
    override func prepareForReuse()
    {
        super.prepareForReuse()
        
        for starView in self.starViews
        {
            starView.removeFromSuperview()
        }
        
        for view in self.contentView.subviews
        {
            if view.tag == 666
            {
                view.removeFromSuperview()
            }
        }
        
        self.starViews = []
    }
    
    func configure(photoItem: HTPhotoItem)
    {
        let image = UIImage(named: photoItem.photoName)
        self.photoView.image = image
        
        for _ in 0...photoItem.numberOfStars
        {
            let imageView = UIImageView(image: UIImage(named: "star"))
            imageView.alpha = 0.8
            self.contentView.addSubview(imageView)
            self.starViews.append(imageView)
        }
        
        let formatter = NSDateFormatter()
        formatter.dateFormat = "EEE MMM dd HH:mm:ss"
        self.dateLabel.text = formatter.stringFromDate(photoItem.date)
        
        let overlay = UIView()
        overlay.backgroundColor = UIColor.whiteColor()
        overlay.alpha = 0.1
        overlay.tag = 666
        self.contentView.addSubview(overlay)
     
        self.setNeedsLayout()
    }
}
