function get-scoop-script {
if ($args) {
if (test-path -Path "~/scoop/apps/$args") {
get-content -Raw $(Get-Command "$args.ps1").Source
} else {
write-error "Application not located in scoop directory"
}
}
}
