//
//  AppDelegate.swift
//  XMLParser Demo
//
//  Created by Eugene Mozharovsky on 8/29/15.
//  Copyright © 2015 DotMyWay LCC. All rights reserved.
//

import UIKit
import XMLParser

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        /// Parsing an XML string from a Dictionary
        let body = [
            "request" : [
                "meta" : [
                    "type" : "getOrder",
                    "date" : "2015-08-29 12:00:00",
                    "device_name" : "iPhone 6 Plus",
                    "device_os_version" : "iOS 9"
                ]
            ],
            
            "encryption" : [
                "type" : "RSA"
            ]
        ]
        
        let header = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n"
        let result = XMLParser.sharedParser.encode(body, header: header)
        print(result)
        
        
        /// Extracting data from an XML converted string
        let convertedString = "<request><meta><type>getOrder</type><date>2015-08-29 12:00:00</date><device_name>iPhone 6 Plus</device_name><device_os_version>iOS 9</device_os_version></meta></request><encryption><type>RSA</type></encryption>"
        let result1 = XMLParser.sharedParser.decode(convertedString)
        print(result1)
        
        return true
    }


}

