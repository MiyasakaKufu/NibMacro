//
//  Macros.swift
//  NibMacro
//
//  Created by naoya.miyasaka on 2025/06/28.
//

import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxMacros

@main
struct ECSMacros: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        NibGenerableMacro.self
    ]
}
