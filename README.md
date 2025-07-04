# NibMacro

NibMacro is a Swift package that provides a custom macro for generating boilerplate code related to nib (XIB) file handling in Swift projects. It leverages Swift's macro system and the [swift-syntax](https://github.com/apple/swift-syntax) library.

(Implemented as a learning exercise for Swift Macros)

## Features

- **NibGenerable Macro**:  
  Automatically generates a static property `nibName` for classes, which returns the class name as a string.  
  This is useful for working with nib files in UIKit or AppKit projects.

## Usage

1. Add `NibMacro` as a dependency in your `Package.swift`:

```swift
.package(url: "https://github.com/MiyasakaKufu/NibMacro.git", from: "0.0.1")
```

2. Import and use the macro in your code:

```swift
@NibGenerable
class MyCustomView: UIView {
    // The macro will generate:
    // static var nibName: String { "MyCustomView" }
}

@NibGenerable
class MyCustomView2<T>: UIView {
    // The macro will generate:
    // static var nibName: String { "MyCustomView2" }
}
```

## Requirements

- Swift 6.0 or later
- macOS 10.15+ or iOS 13+
- Xcode 16 or later

## Development

This package uses [swift-syntax](https://github.com/apple/swift-syntax) for macro implementation.  
See the `Sources/Macros` directory for macro source code ~~and `Tests/NibMacroTests` for usage examples~~.

## License

MIT

## Note

This package is unlikely to be updated frequently. Sorry for the inconvenience.
