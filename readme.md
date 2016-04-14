# Fun With Instruments
#### NSMeetup, San Francisco, CA April 6, 2016
#### Doug Suriano


### Hi!
First off, thank you to everybody who came out. I super appreciate it. In this repo, I've included slides, links, and repos of each little demo app I made.

#### Corrections!
First, **very** good news. The issue with saving custom instruments has been fixed in Xcode 7.3 Make sure you buy everybody on the Instruments team beer at WWDC!

#### Video
I **think** the talk was recoreded, but I don't know the status of it. As soon as there is a video, I will post it here.

#### Slides
In this repo there is a copy of my compressed keynote file. I also included a PDF copy but it doesn't include the videos.

#### Links
There are so many awesome great articles about using instruments, I wanted to include some of them here:

* [https://developer.apple.com/library/tvos/documentation/DeveloperTools/Conceptual/InstrumentsUserGuide/](Instruments User Guide) - Straight from the source. This guide is actually very well written and very informative. This is a good place to start with any Instruments issue.
* [https://www.bignerdranch.com/blog/hooked-on-dtrace-part-1/](Hooked on DTrace) - This is part 1 of a 3 part guide on DTrace. Very detailed and a great intro to DTrace.
* [https://www.objc.io/issues/19-debugging/dtrace/](objc.io - DTrace) - Part of issue 19 of objc.io, this is also a great article about using DTrace. I really like their solution for using probes in Swift (since Swift doesn't support macros).
* [http://quellish.tumblr.com/post/138115375147/measuring-custom-app-behavior-in-instruments](Measuring Custom App Behavior in Instruments) - This is a great guide on how to create a custom instrument for your iOS app. Quellish's example is also pretty awesome, checking if `NSURLCache` is caching a response.
* [http://initwithfunk.com/blog/2013/05/31/breaking-bad-with-dtrace/](http://initwithfunk.com/blog/2013/05/31/breaking-bad-with-dtrace/) - Another solid article about using DTrace with instruments.
