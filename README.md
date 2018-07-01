# OkLog for iOS
OkLog for iOS is a network logger written in Swift highly inspired by [simonpercic's original OkLog implementation](https://github.com/simonpercic/OkLog/).

[![Build Status](https://app.bitrise.io/app/bf1b3bd0c95a018e/status.svg?token=UmHfbCooX9k1sF99MvMWKQ&branch=master)](https://app.bitrise.io/app/bf1b3bd0c95a018e)

## What does it do?
OkLog encodes request & response data and generates an URL from where you can see all those info nicely, making it nice to debug and share network data.

## Installation
OkLog for iOS is integrated with [CocoaPods](http://cocoapods.org). To use it in your project, add to your `Podfile`:
```ruby
pod 'OkLog'
```

and then don't forget running:
```bash
$ pod install
```

## Usage
In the `URLSession`'s result closure simply call
```swift
OkLog.log(request: request, response: response, data: data)
```
to get the URL printed in Xcode's console, or
```swift
let url = OkLog.getUrl(request: request, response: response, data: data)
```
to retrieve it and do whatever you want.

To avoid replication, consider adding it inside your API Client implementation, or as a RequestAdapter for Alamofire.

An example project is included with a few sample requests.
