//
//  HTPhotosTableViewController.swift
//  ScrollingPerformance
//
//  Created by Doug Suriano on 4/2/16.
//  Copyright © 2016 Hotel Tonight. All rights reserved.
//

import UIKit

class HTPhotosTableViewController: UITableViewController {

    let kResuseIdentifier = "kReuseIdentifier"
    var items: Array<HTPhotoItem> = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.title = "Cata-Carta"
        
        self.tableView.registerClass(HTPhotoItemTableViewCell.self, forCellReuseIdentifier: kResuseIdentifier)
        self.tableView.separatorStyle = .None
        
        HTPhotoItemGenerator.generatePhotoItems { (photoItems) in
            self.items = photoItems
            self.tableView.reloadData()
        }
        
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.items.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier(kResuseIdentifier, forIndexPath: indexPath) as? HTPhotoItemTableViewCell
        
        let photoItem = self.items[indexPath.row]
        
        cell?.configure(photoItem)
        
        let quoteGenerator = HTQuoteGenerator()
        cell?.quoteLabel.attributedText = quoteGenerator.getRandomAttributedQuote()

        return cell!
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        let photoItem = self.items[indexPath.row]
        let image = UIImage(named: photoItem.photoName)
        
        if let image = image
        {
            return image.size.height + 150.0
        }
        
        return 50.0
    }
    
    override func scrollViewDidScroll(scrollView: UIScrollView)
    {
        print(String(scrollView.contentOffset.y))
    }
}
