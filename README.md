<p align="center">
  <img src ="https://raw.githubusercontent.com/Mozharovsky/XMLParser/master/Assets/%3E.png" />
</p>

Overview
==========
* [Description](https://github.com/Mozharovsky/XMLParser#description)
* [Requirements](https://github.com/Mozharovsky/XMLParser#requirements)
* [Installation](https://github.com/Mozharovsky/XMLParser#installation)
* [Usage](https://github.com/Mozharovsky/XMLParser#usage)
* [Author](https://github.com/Mozharovsky/XMLParser#author)
* [License](https://github.com/Mozharovsky/XMLParser#license)

Description
==========
XMLParser lets you convert a pure Swift dictionary into XML string and vice versa. 

Requirements
==========
* Swift 2 (Xcode 7+)
* iOS 8+ 
* ARC

Installation
==========

###Cocoa Pods
```ruby
pod 'XMLParser', '~> 1.0'
```

Usage
==========

####Parsing an XML string from a Dictionary
```swift
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
```

####Result
```XML
<?xml version="1.0" encoding="UTF-8"?>
<encryption>
   <type>RSA</type>
</encryption>
<request>
   <meta>
      <type>getOrder</type>
      <device_os_version>iOS 9</device_os_version>
      <date>2015-08-29 12:00:00</date>
      <device_name>iPhone 6 Plus</device_name>
   </meta>
</request>
```

####Associated tags 
E.g. `<td class='achievements'>0</td>`
```swift
let data = [
    "tr" : [
        XMLTag(header: "td", name: "class", value: "num") : 1,
        XMLTag(header: "td", name: "class", value: "achievments") : 0,
        XMLTag(header: "td", name: "class", value: "sum") : 205
    ]
]

let result = XMLParser.sharedParser.encode(data)
print(result)
```

####Result
```XML
<tr>
   <td class='achievments'>0</td>
   <td class='num'>1</td>
   <td class='sum'>205</td>
</tr>
```

==========


####Extracting data from an XML converted string
```swift
let convertedString = "<request><meta><type>getOrder</type><date>2015-08-29 12:00:00</date><device_name>iPhone 6 Plus</device_name><device_os_version>iOS 9</device_os_version></meta></request><encryption><type>RSA</type></encryption>"
let result = XMLParser.sharedParser.decode(convertedString)
print(result)
```

####Result
```swift
[
  type: [getOrder, RSA], 
  device_os_version: [iOS 9], 
  date: [2015-08-29 12:00:00], 
  device_name: [iPhone 6 Plus]
]
```


Author
==========
Eugene Mozharovsky ([@DottieYottie](https://twitter.com/DottieYottie))

[License](https://github.com/Mozharovsky/XMLParser/blob/master/LICENSE)
==========
