//
//  HTQuoteGenerator.swift
//  ScrollingPerformance
//
//  Created by Doug Suriano on 4/2/16.
//  Copyright © 2016 Hotel Tonight. All rights reserved.
//

import UIKit

class HTQuoteGenerator: NSObject
{
    var quotes: Array<String> = []
    
    override init()
    {
        super.init()
        updateMagnaCartaQuotes()
    }
    
    func updateMagnaCartaQuotes()
    {
        let path = NSBundle.mainBundle().pathForResource("magna", ofType:"json")
        
        do {

            let jsonString = try NSString(contentsOfFile: path!, encoding: NSUTF8StringEncoding)
            let jsonData = jsonString.dataUsingEncoding(NSUTF8StringEncoding)
            let jsonArray = try NSJSONSerialization.JSONObjectWithData(jsonData!, options: .AllowFragments) as? NSArray
            
            self.quotes = jsonArray as! Array<String>
            
        }
        catch
        {
            assert(false)
        }
    }
    
    func getRandomAttributedQuote() -> NSAttributedString
    {
        let randomIndex = Int(arc4random_uniform(UInt32(self.quotes.count)))
        let data = self.quotes[randomIndex].dataUsingEncoding(NSUTF8StringEncoding)
        
        do
        {
            let options: [String : AnyObject] = [
                NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType
            ]
            
            return try NSAttributedString(data: data!, options: options, documentAttributes: nil)
        }
        catch
        {
            assert(false, "Error converting html string")
        }
        
        return NSAttributedString(string: "")
    }

}
