# HashTable containing every file sourced by my $PROFILE

$allConfigHash = @{
    Files = @{
	Profile = "$PROFILE"
	projectvars = "$projectvarsScript"
	FunctionScripts = @{
	    otherFunctions = "$otherFunctionsScript"
	    gitFunctions = "$scriptspwsh\git_functions.ps1"
	    wslFunctions = "C:\Users\Carl\gitstuff\scripts-pwsh\config\wslFunctions.ps1"
	    chocoFunctions = "C:\Users\Carl\gitstuff\scripts-pwsh\config\choco_functions.ps1"
	    PATH_mods = "C:\Users\Carl\gitstuff\scripts-pwsh\config\PATH_mods.ps1"
	    useful_nav_functions = "$(Split-path -Parent $scriptspwsh)\Scripts\useful-nav-functions.ps1"
	}
    }
    PSDirectory = (Split-Path -Parent $PROFILE)
}
