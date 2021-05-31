# FileSystem functions
# Author: Carl C.
# OriginalLocation: "$env:OneDrive\snippets\pwsh\FileSystemFunctions\fileFunctions.ps1"

function Count-Files {

    <#
    .Description
    Count-Files: Count the files in a directory
    .PARAMETER Path
    The path of the directory to count files in.
    #>
    [CmdletBinding()]
    Param(
	[Parameter(Mandatory = $false,
	    HelpMessage = "Enter the path")]
	[string]$Path
    )

    Process {
	if ($Path) {
	    return $(Get-ChildItem $Path).Count
	}
	else {
	    return Write-Error "Need to enter path"
	}
    }
}
