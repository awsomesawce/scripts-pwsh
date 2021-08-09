switch -Regex ($env:OneDrive)
{
"Carl" {($_).toString().Replace('Carl', 'Someone') }
"D:" {"$_ has a D in it"}
"\\" {(get-item $_) && @"
is a windows path.
"@}
}
