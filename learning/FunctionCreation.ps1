<#
.SYNOPSIS
Ways of Creating Functions
.DESCRIPTION
Found awesome new way of creating simple functions without using the `function` keyword.
#>

# You can just use the `$function:` variable prefix, or `New-Item Function:\function_name`
$gitst = "git status"
$function:gitst = [scriptblock]::Create($gitst)
# Now you can use get-command to see whether or not it is a command
Get-Command gitst | select-object *
# Super cool!

# This method is even more simple than the first
new-item Function:\gitpp -ItemType Function -Value 'git pull && git push'
