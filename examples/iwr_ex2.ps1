# This will assign chtsh's curl page as a pwsh variable object.
# Works differently than just calling curl.

$curlChtsh = (Invoke-WebRequest -Uri https://cht.sh/curl)

$curlChtsh | Select-Object -ExpandProperty Content # This will show the content just as if curl was called.
# ($curlChtsh).Content will result in the same output as the above statement.
