#!/usr/bin/env pwsh

# vim:set et sw=4 ts=4:
class MyClass {
    # Property: Holds name
    [String] $Name

    # Constructor: Creates a new MyClass object, with the specified name
    MyClass([String] $NewName) {
        # Set name for MyClass
        $this.Name = $NewName
    }

    # Method: Method that changes $Name to the default name
    [void] ChangeNameToDefault() {
        $this.Name = "DefaultName"
    }
}
