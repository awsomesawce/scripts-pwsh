"# Classes demonstration
$((Get-history -Id 39).CommandLine)
# And then:

$(Get-history -Id 42,43,44 | ForEach-Object {echo $_.CommandLine "`n"})"
