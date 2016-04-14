//
//  HTPhotosTableViewController.swift
//  ScrollingPerformance
//
//  Created by Doug Suriano on 4/2/16.
//  Copyright © 2016 Hotel Tonight. All rights reserved.
//

import UIKit

class HTPhotosTableViewController: UITableViewController, HTQuoteGeneratorDelegate {

    let kResuseIdentifier = "kReuseIdentifier"
    var items: Array<HTPhotoItem> = []
    let quoteGenerator = HTQuoteGenerator()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.quoteGenerator.delegate = self
        
        self.title = "Cata-Carta"
        
        self.tableView.registerClass(HTPhotoItemTableViewCell.self, forCellReuseIdentifier: kResuseIdentifier)
        self.tableView.separatorStyle = .None
        
        HTPhotoItemGenerator.generatePhotoItems { (photoItems) in
            self.items = photoItems
            self.quoteGenerator.updateMagnaCartaQuotes()
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
        
        quoteGenerator.getRandomAttributedQuote { (quote) -> Void in
            cell?.quoteLabel.attributedText = quote
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                cell?.quoteLabel.alpha = 1.0
            })
        }

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
    
    func didLoadQuotes(generator: HTQuoteGenerator)
    {
        self.tableView.reloadData()
    }
}
