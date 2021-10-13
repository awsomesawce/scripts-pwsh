#!/usr/bin/env pwsh
# Using [ref] to create reference variables
# Author: Carl C.
# Email: awsomesawce@outlook.com

$Script:__doc__ = @"
Using [ref] to create reference vars
"@

$script:__package__ = "scripts-pwsh/learning"
$script:notes = [System.Collections.Specialized.StringCollection]::new()

$null = $notes.Add("This is a list of strings")

write-output $__package__
write-output "$notes are the notes."

$notes.Add("another string")