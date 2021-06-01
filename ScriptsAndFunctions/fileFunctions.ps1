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
function 7zTarFile {
<#
.Description
Take an existing .tar file and compress it using 7z
.Notes
This is great for keeping the Unix permissions data in
tact when backing something up with 7z.
By default, 7z will not retain permissions data.
#>
param(
[Parameter(Mandatory=$false,HelpMessage="The string that defines the file")]
[string]
$FileTo7z
)
if (Get-Command 7z -ErrorAction SilentlyContinue) {
if ($FileTo7z) {
$whParams = @{ForegroundColor = "cyan"}
Write-Host @whParams "Executing 7z on $FileTo7z"
7z a "$FileTo7z.7z" "$FileTo7z"
} else {Write-Error "Need a file to 7z"}
} else {Write-Error "Need 7z installed"}
}
