# This is an example of if statements.
#

$a = 3

if ($a -gt 2) {
    Write-Output "The value $a is greater than 2."

} else {
    Write-Output "The value of '$a' is not greater than 2."
}
$b = 5

$message = ( $b -gt 3 ) ? "That is true" : "that is false"

($message)

$pathTest = (Test-Path (Get-ChildItem ~/test/testing.md)) ? "The path exists" : "The path does not exist"

($pathTest)

# The if statement under here does not work.
#if ($PROFILE -like "Microsoft*") {
#    Write-Output "That profile is your personal profile"
#} else {
#	Write-Output "it did not work"
#	}
