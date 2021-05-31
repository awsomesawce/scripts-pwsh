function create-7z-archive {
<#
.DESCRIPTION
This is a function that creates a 7z archive if it exists on the system
.PARAMETER Path
The path of the file/dir to archive
.PARAMETER DestPath
The destination path of the archive
#>
[CmdletBinding(SupportsShouldProcess=$true)]
param(
[Parameter(Mandatory = $true,
HelpMessage="This is the help message")]
[String] $Path
)

Process {
echo "This is the process"
}
}
