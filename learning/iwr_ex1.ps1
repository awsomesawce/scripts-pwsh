Invoke-WebRequest -Uri https://cht.sh/curl | select -ExpandProperty Content | Write-Output
