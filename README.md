# HalfPie

[![CI Status](https://img.shields.io/travis/ravi7876/HalfPie.svg?style=flat)](https://travis-ci.org/ravi7876/HalfPie)
[![Version](https://img.shields.io/cocoapods/v/HalfPie.svg?style=flat)](https://cocoapods.org/pods/HalfPie)
[![License](https://img.shields.io/cocoapods/l/HalfPie.svg?style=flat)](https://cocoapods.org/pods/HalfPie)
[![Platform](https://img.shields.io/cocoapods/p/HalfPie.svg?style=flat)](https://cocoapods.org/pods/HalfPie)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## How To

    1. init HalfPie
```
    let roundView = HalFPie()
```
    2. Customization
```
    roundView.frontLineWidth = 3
    roundView.bottomLineWidth = 5
    roundView.frontLineColor = .green
    roundView.bottomLineColor = .lightGray
    roundView.needPointer = true
```
    3. Set Value
```
    roundView.Add_PieViewFor(value: 5.9, total: 25)
```
    Enjoy !!!
    
## Requirements

## Installation

HalfPie is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'HalfPie'
```

## Author

Ravi Jobanputra, ravi.joban@gmail.com

## License

HalfPie is available under the MIT license. See the LICENSE file for more info.
