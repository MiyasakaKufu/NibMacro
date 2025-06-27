@attached(member, names: named(nibName), named(init))
public macro NibGenerable() = #externalMacro(
    module: "Macros",
    type: "NibGenerableMacro"
)

