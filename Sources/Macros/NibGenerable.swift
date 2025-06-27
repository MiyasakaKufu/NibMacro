//
//  NibGenerable.swift
//  NibMacro
//
//  Created by naoya.miyasaka on 2025/06/28.
//

import Foundation
import SwiftSyntax
import SwiftSyntaxMacros

struct NibGenerableMacro: MemberMacro {
    static func expansion(
        of node: AttributeSyntax,
        providingMembersOf declaration: some DeclGroupSyntax,
        conformingTo protocols: [TypeSyntax],
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {
        guard let typeSyntax = declaration.as(ClassDeclSyntax.self)?.name else {
            throw CustomError("invallid argument")
        }

        let typeName = typeSyntax.text

        let declSyntax: DeclSyntax = """
        static var nibName: String {
            "\(raw: typeName)"
        }
        """

        return [
            declSyntax
        ]
    }

    private static func lowerCamelCase(_ name: String) -> String {
        guard let first = name.first else { return name }
        return first.lowercased() + name.dropFirst()
    }

    struct CustomError: Error, CustomStringConvertible {
        var description: String
        init(_ message: String) { self.description = message }
    }
}
