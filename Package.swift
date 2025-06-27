// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import CompilerPluginSupport

struct Module {
    let name: String

    init(name: String) {
        self.name = name
    }

    var dependency: Target.Dependency {
        Target.Dependency(stringLiteral: name)
    }
}

extension Module {
    static let nibMacro = Module(name: "NibMacro")
    static let macros = Module(name: "Macros")
    static let nibMacroTests = Module(name: "NibMacroTests")
}

extension Target {

    static func target(module: Module, dependencies: [Module]) -> Target {
        .target(
            name: module.name,
            dependencies: dependencies.map { $0.dependency }
        )
    }

    static func testTarget(module: Module, dependencies: [Module]) -> Target {
        .testTarget(
            name: module.name,
            dependencies: dependencies.map { $0.dependency }
        )
    }

    static func macro(module: Module, dependencies: [Module]) -> Target {
        .macro(
            name: module.name,
            dependencies: [
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax")
            ] + dependencies.map { $0.dependency }
        )
    }

}

let package = Package(
    name: "NibMacro",
    platforms: [
        .macOS(.v10_15), .iOS(.v13)
    ],
    products: [
        .library(
            name: Module.nibMacro.name,
            targets: [Module.nibMacro.name])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-syntax.git", from: "601.0.1")
    ],
    targets: [
        .target(module: .nibMacro, dependencies: [.macros]),
        .macro(module: .macros, dependencies: []),
        .testTarget(module: .nibMacroTests, dependencies: [.nibMacro]),
    ]
)
