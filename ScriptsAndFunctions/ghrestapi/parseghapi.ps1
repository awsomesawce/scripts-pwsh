
<#
.Description
Testing out awesome gh api some more
#>
if ($args) { throw "does not need args" }
else {
    if (Get-Command jq -ErrorAction ignore) {
        $req = Invoke-WebRequest 'https://api.github.com/repos/awsomesawce/scripts-pwsh/commits/359064b90e9e043a4f4bc07d768629f4e4c6ea6d'
        $req.content | jq | ConvertFrom-Json | ForEach-Object files
    }
    else { throw "Needs jq for this function" }
}

