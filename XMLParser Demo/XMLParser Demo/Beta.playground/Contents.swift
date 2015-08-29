//: Playground - noun: a place where people can play

import Cocoa

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




let a = "<a>a</a><a>b</a><a>c</a><b>dd</b><b>gg</b>"

let header = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n"
let result = XMLParser.sharedParser.encode(body, header: header)
print(result)

XMLParser.sharedParser.decode(a)["a"]
