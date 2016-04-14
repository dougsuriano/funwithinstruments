//
//  HTQuoteGenerator.swift
//  ScrollingPerformance
//
//  Created by Doug Suriano on 4/2/16.
//  Copyright © 2016 Hotel Tonight. All rights reserved.
//

import UIKit

protocol HTQuoteGeneratorDelegate: NSObjectProtocol
{
    func didLoadQuotes(generator: HTQuoteGenerator)
}

class HTQuoteGenerator: NSObject
{
    var quotes: Array<String> = []
    weak var delegate: HTQuoteGeneratorDelegate?
    
    override init()
    {
        super.init()
        updateMagnaCartaQuotes()
    }
    
    func updateMagnaCartaQuotes()
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), {
            let path = NSBundle.mainBundle().pathForResource("magna", ofType:"json")
            
            do {
                
                let jsonString = try NSString(contentsOfFile: path!, encoding: NSUTF8StringEncoding)
                let jsonData = jsonString.dataUsingEncoding(NSUTF8StringEncoding)
                let jsonArray = try NSJSONSerialization.JSONObjectWithData(jsonData!, options: .AllowFragments) as? NSArray
                
                self.quotes = jsonArray as! Array<String>
                
                dispatch_async(dispatch_get_main_queue(), {
                    self.delegate?.didLoadQuotes(self)
                })
                
                self.delegate?.didLoadQuotes(self)
                
            }
            catch
            {
                assert(false)
            }
        })
        
        
    }
    
    func getRandomAttributedQuote(completion: (quote: NSAttributedString) -> Void)
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), {
            let randomIndex = Int(arc4random_uniform(UInt32(self.quotes.count)))
            let data = self.quotes[randomIndex].dataUsingEncoding(NSUTF8StringEncoding)
            
            do
            {
                let options: [String : AnyObject] = [
                    NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType
                ]
                
                let quote = try NSAttributedString(data: data!, options: options, documentAttributes: nil)
                
                dispatch_async(dispatch_get_main_queue(), {
                    completion(quote: quote)
                })
            }
            catch
            {
                assert(false, "Error converting html string")
            }
        })
    }

}
