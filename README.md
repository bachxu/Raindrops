# Raindrops

A custom tabBar in Swift.

[![CI Status](http://img.shields.io/travis/bach/Raindrops.svg?style=flat)](https://travis-ci.org/bach/Raindrops)
[![Version](https://img.shields.io/cocoapods/v/Raindrops.svg?style=flat)](http://cocoapods.org/pods/Raindrops)
[![License](https://img.shields.io/cocoapods/l/Raindrops.svg?style=flat)](http://cocoapods.org/pods/Raindrops)
[![Platform](https://img.shields.io/cocoapods/p/Raindrops.svg?style=flat)](http://cocoapods.org/pods/Raindrops)

## Requirements

- iOS 8.0+
- Xcode 8.1+
- Swift 3.0+

## Installation

### CocoaPods

[CocoaPods](https://cocoapods.org/) is a dependency manager for Swift and Objective-C Cocoa projects. You can install it with following command:

```bash
$ sudo gem install cocoapods
```

To integrate Raindrops into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
souce 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'Raindrops', '~> 1.0'
end
```

Then, run the following command:

```bash
$ pod install
```

### Manually

If you prefer not to use CocoaPods, you can integrate Raindrops into your project manually.

1. Clone or download `Raindrops` repository.
2. Add the source files in Raindrops to your project.

## Usage

Initialize the tabBar view with basic information.

```swift
let customTabBar = RdCustomTabBar()
customTabBar.backgroundColor = UIColor(red: 0.29, green: 0.71, blue: 0.93, alpha: 1.00)
// the current tabBar item is selected.
customTabBar.selectedIndex = 0
```

Set the notifications' name. The count of notifications' name relates to the tabBar of how many tabBar item exists.

```swift
customTabBar.notificationsName = ["NCFirstModule", "NCSecondModule", "NCThirdModule", "NCForthModule"]
```

Adopt the `TabBarDataSource` and `TabBarDelegate` protocols in your view controller.

```swift
class ViewController: UIViewController, TabBarDataSource, TabBarDelegate

customTabBar.datasource = self
customTabBar.delegate = self
```

Implement the method for `TabBarDataSource` to make custom tabBar item style.

```swift
func tabBar(_ tabBar: RdCustomTabBar, cellForItemAt index: Int) -> RdCustomBarItem {
    let item = RdCustomBarItem(style: CustomBarItemStyle.Default)
    item.titleLabel.text = "First"
    item.titleLabel.textColor = UIColor.black
    item.imageView.image = UIImage(named: "image_normal")
    item.imageView.highlightedImage = UIImage(named: "image_selected")
    return item
}
```

Implement the method for `TabBarDelegate` to set the top of insets for tabBar item.

```swift
func tabBarInsetsOfTop(_ tabBar: RdCustomTabBar, cellForItemAt index: Int) -> CGFloat {
    return 0
}
```

Create the main view controller to observe the notification and manage the view stack.

```swift
NotificationCenter.default.addObserver(self, selector: #selector(firstModule(notification:)), name: NSNotification.Name("NCFirstModule"), object: nil)

func firstModule(notification: Notification) {
    let firstVC = FirstVC()
    self.navigationController!.popToRootViewController(animated: false)
    self.navigationController?.pushViewController(firstVC, animated: false)
}
```

## License

Raindrops is available under the MIT license. See the LICENSE file for more info.
