# OkLog for iOS
OkLog for iOS is a network logger written in Swift highly inspired by [simonpercic's original OkLog implementation](https://github.com/simonpercic/OkLog/).

[![Build Status](https://app.bitrise.io/app/bf1b3bd0c95a018e/status.svg?token=UmHfbCooX9k1sF99MvMWKQ&branch=master)](https://app.bitrise.io/app/bf1b3bd0c95a018e)

## What does it do?
OkLog encodes request & response data and generates an URL from where you can see all those info nicely, making it easy to debug and share network data. [Here's an example](http://oklog.responseecho.com/v1/r/H4sIAAAAAAAAE1WQTU_DMAyG7_yKycepS1c2KlbEoaBJCE1CQnDrJSReGmiTkGQSUO2_47Qgxs1-_bz-GoB7FaAajhlIHjlUMDSgZQPVKmvA8B4pbODetmZWO9dhQKTqETLYa8om6976fopa5BJ9kqEWAl2kjvN8TviULrZGWKmNIl19aXf1fl2wZTYTtnceQ6B8yS7-8B036sAVEo7mFyb95nEkN0TeWmNQRG0NQaKzAScxoiE_GhVbKqzOT9SnT5c6cjpIC56s-WsgfwZ3NqSV2xjdizbMekXic0C_qBU5qfTwtrNq-8F7egbQxaORztUy_Wx8GVH_H5Y467XSacWivGTFZs2KsmDlmtoffPczMlR5fjI6l9hhpCln34MRloGoAQAA?qb=H4sIAAAAAAAAE6tWykxRsjLWUcpLzE1VslLyys_IU3AsKMhJLU5NTVGqBQDWFO9RIAAAAA==&d=H4sIAAAAAAAAE4WQzUoDMRRGKVOLhqIlIGhFyEYo4vxkLFK7G9pBkUrBVtfG6SVNGpMhkxnr1qfpo_hYTgV3oqsL957vXPhQa5xO0nmKu0vn8mIYhtv5InRgLA8XoMBBd-f71iMxQe2R0Q608-fvOeAOy3MlMuaE0aEsjI67CD0WYP2E1xBuT1cTw9M1e80V3H42Hna1IWCtsc8bT_5rk4do_4eYgOZuib1-3JdHCNVrDdmWxGgFkPtMiQpkD5Eky6Ao_G3OGuUnSpk3f2RhUVsEUwVuOltC_fzkV3JqBRcaN87lMWrNwFZg8QEvtciM1SG9DgYBlR3kPQmG92hASQW8tPIMNcfMAT6dlfqCRJTclYrEER0QejWM6PAyIjf38_XG-2j80fQXeQd4P44BAAA=&s=1).

## Installation
OkLog for iOS is integrated with [CocoaPods](http://cocoapods.org). To use it in your project, add to your `Podfile`:
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
in the request's completion closure

An example project is included with a few sample requests.
