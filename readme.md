# Fun With Instruments
#### NSMeetup, San Francisco, CA April 6, 2016
#### Doug Suriano


### Hi!
First off, thank you to everybody who came out. I super appreciate it. In this repo, I've included slides, links, and repos of each little demo app I made.

#### Corrections!
First, **very** good news. The issue with saving custom instruments has been fixed in Xcode 7.3 Make sure you buy everybody on the Instruments team beer at WWDC!

#### Video
[Here is a link to the recording](https://www.youtube.com/watch?v=Su5D8Z3CDV4) on YouTube.

#### Slides
In this repo there is a copy of my compressed keynote file. I also included a PDF copy but it doesn't include the videos.

#### Links
There are so many awesome great articles about using instruments, I wanted to include some of them here:

* [Instruments User Guide](https://developer.apple.com/library/tvos/documentation/DeveloperTools/Conceptual/InstrumentsUserGuide/) - Straight from the source. This guide is very well written and very informative. This is a good place to start with any Instruments issue.
* [Hooked on DTrace](https://www.bignerdranch.com/blog/hooked-on-dtrace-part-1/) - This is part 1 of a 3 part guide on DTrace. Very detailed and a great intro to DTrace.
* [objc.io - DTrace](https://www.objc.io/issues/19-debugging/dtrace/]- Part of issue 19 of objc.io, this is also a great article about using DTrace. I really like their solution for using probes in Swift (since Swift doesn't support macros).
* [Measuring Custom App Behavior in Instruments](http://quellish.tumblr.com/post/138115375147/measuring-custom-app-behavior-in-instruments) - This is a great guide on how to create a custom instrument for your iOS app. Quellish's example is also pretty awesome, checking if `NSURLCache` is caching a response.
* [Breaking Bad With DTrace](http://initwithfunk.com/blog/2013/05/31/breaking-bad-with-dtrace/) - Another solid article about using DTrace with instruments.
