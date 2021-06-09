<#
.Description
This will execute all "Backup-*" scripts in this directory"
#>
param([string]$Arg)
$backupscripts = get-childitem -path ./Backup-*
process {
	if ($arg) {
		Write-Output "This script does not need arguments"
	} else {
		foreach ($script in $backupscripts) {
			& $script || Write-Error "Something went wrong"
		}
	}
}
end {
	Write-Output "End of script"
}

