$iwrGitHubApi = (Invoke-WebRequest "https://api.github.com")
$iwrContent = $iwrGitHubApi.Content
$iwrContentPretty = $iwrContent | jq
$iwrHash = $iwrContentPretty | ConvertFrom-Json -AsHashtable
# You now have a hashtable in Powershell that has all the keys and values from the github api
# json file.  Cool huh?
