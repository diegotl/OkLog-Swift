# OkLog for iOS and macOS
[![Build Status](https://app.bitrise.io/app/dae5e4af48f49ab5/status.svg?token=Z7i_ZSE2M1FAD-F3H_lc8Q)](https://app.bitrise.io/app/dae5e4af48f49ab5)
[![SPM compatible](https://img.shields.io/badge/SPM-compatible-4BC51D.svg?style=flat)](https://swift.org/package-manager)
![CocoaPods Compatible](https://img.shields.io/cocoapods/v/OkLog.svg)
[![codebeat badge](https://codebeat.co/badges/f89dff10-4b71-4499-ba25-5cd80a7483c7)](https://codebeat.co/projects/github-com-diegotl-oklog-swift-master)
![Languages](https://img.shields.io/badge/languages-Swift%20%7C%20ObjC-333333.svg)

OkLog-Swift is a network logger written in Swift highly inspired by [simonpercic's original OkLog implementation](https://github.com/simonpercic/OkLog/) to be used in iOS and macOS projects.

## What does it do?
OkLog encodes request & response data and generates an URL from where you can see all those info nicely, making it easy to debug and share network data. [Here's an example](http://oklog.responseecho.com/v1/r/H4sIAAAAAAAAE1WQTU_DMAyG7_yKycepS1c2KlbEoaBJCE1CQnDrJSReGmiTkGQSUO2_47Qgxs1-_bz-GoB7FaAajhlIHjlUMDSgZQPVKmvA8B4pbODetmZWO9dhQKTqETLYa8om6976fopa5BJ9kqEWAl2kjvN8TviULrZGWKmNIl19aXf1fl2wZTYTtnceQ6B8yS7-8B036sAVEo7mFyb95nEkN0TeWmNQRG0NQaKzAScxoiE_GhVbKqzOT9SnT5c6cjpIC56s-WsgfwZ3NqSV2xjdizbMekXic0C_qBU5qfTwtrNq-8F7egbQxaORztUy_Wx8GVH_H5Y467XSacWivGTFZs2KsmDlmtoffPczMlR5fjI6l9hhpCln34MRloGoAQAA?qb=H4sIAAAAAAAAE6tWykxRsjLWUcpLzE1VslLyys_IU3AsKMhJLU5NTVGqBQDWFO9RIAAAAA==&d=H4sIAAAAAAAAE4WQzUoDMRRGKVOLhqIlIGhFyEYo4vxkLFK7G9pBkUrBVtfG6SVNGpMhkxnr1qfpo_hYTgV3oqsL957vXPhQa5xO0nmKu0vn8mIYhtv5InRgLA8XoMBBd-f71iMxQe2R0Q608-fvOeAOy3MlMuaE0aEsjI67CD0WYP2E1xBuT1cTw9M1e80V3H42Hna1IWCtsc8bT_5rk4do_4eYgOZuib1-3JdHCNVrDdmWxGgFkPtMiQpkD5Eky6Ao_G3OGuUnSpk3f2RhUVsEUwVuOltC_fzkV3JqBRcaN87lMWrNwFZg8QEvtciM1SG9DgYBlR3kPQmG92hASQW8tPIMNcfMAT6dlfqCRJTclYrEER0QejWM6PAyIjf38_XG-2j80fQXeQd4P44BAAA=&s=1).

## Installation
### CocoaPods
OkLog is integrated with [CocoaPods](http://cocoapods.org). To use it in your project, add to your `Podfile`:
```ruby
pod 'OkLog'
```
or
```ruby
pod 'OkLog/Alamofire'
```

and then don't forget to run:
```bash
$ pod install
```

### Swift Package Manager
OkLog is also available through SPM.

## Usage
#### URLSession
In the `URLSession`'s result closure simply call
```swift
OkLog.log(request: request, response: response, data: data)
```
to get the URL printed in Xcode's console, or
```swift
let url = OkLog.getUrl(request: request, response: response, data: data)
```
to retrieve it and do whatever you want.

#### Alamofire
If you are using Alamofire, place
```swift
OkLog.log(response)
```
or
```swift
let url = OkLog.getUrl(response)
```
in the request's completion closure.

You can also opt-out from URL shortening by specifying `shortenUrl: false` as parameter.

#### Request duration
To have the request duration printed in the log you need to tell OkLog right before the request gets executed (this is optional).
```swift
OkLog.willSend(request)
```

An example project is included with a few sample requests using URLSession and Alamofire.
