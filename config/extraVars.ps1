# Offloading some vars from projectvars.ps1
# This file is mainly filled with experimental and/or unneeded variables and functions.
# Debating on whether to start from scratch.

# List of current document directories for writings:
$newestDocumentDirs = @{
    Name = "List of New Document Dirs"
    NameOfHashTable = "`$newestDocumentDirs"
    NotableNotes="$env:OneDrive\Notable\notes"
    MDBook= Get-Item "$env:USERPROFILE\gitstuff\mdbook_test"
    bashSnippets = Get-item "$env:OneDrive\snippets\bash"
    pwshSnippets = "$pwshSnippetsDir"
    OneDriveDocuments = "$env:OneDrive\Documents"
    DESKTOP = "$env:OneDrive\Desktop"
    CurrentSnippetFile = "$curSnipFile"
    Downloads = @{
        CDownloads = Get-Item "~/Downloads"
        DDownloads = "$ddownloads"
    }
    UsefulVars = @("`$documents", "`$zshlovers", "`$editorconfigtemplate", "`$dotfileDirs")

# NOTE: It might be better to offload certain functions as a script file. 
# NOTE: Functions are sourced and are executed from memory while the PSSession is active.
# NOTE: Powershell Scripts, however, are executed from the filesystem.
function ListDocumentDirs {
    if ($args) {
        write-error "This function does not need args.
        Try again."
    } else {
        Write-Output "List of new Document Dirs:"
        Write-Output $newestDocumentDirs
    }
}
# TODO: Shorten this script and make it so it is not so big.
# IMPORTANT: this is the preferred way of naming project variables.  Be specific.
$windowsDotfilesBackup = "$($dotfileDirs[0])windows"
# TODO: backupDirs and dotfileDirs are very similar, might just remove one.
$backupDirs = @{
# This is a list of backup directories relating to shell config
    tarfiles="D:\Carl\OneDrive\tarfiles\configstuff"
    dotfiles_backup="$env:OneDrive\dotfiles_backup"
    windows_dotfiles_backup="$windowsDotfilesBackup"
}
$msysFiles = @{
    description = "Hash table consisting of deterministic way of finding msys files."
    msysDotfilesGitDir = if ($env:myDotfiles) {"$env:myDotfiles\msys2"} else {"$env:USERPROFILE\gitstuff\my-dotfiles\msys2"}
    msysDotfilesBackupDir = if (Test-Path $dotfileDirs[0]) {"$($dotfileDirs[0])\msys2"}
    msysShellFiles = @{
	msysBashRc = (Test-Path "~/.bashrc") ? ("$env:HOME\.bashrc") : ($null && Write-Error "bashrc not found")
	msysZshRc = if (Test-Path "~/.zshrc.local") {"$env:USERPROFILE\.zshrc.local"}
	msysEntryFile = if (Test-Path "~/.msysEntry") {"$env:USERPROFILE\.msysEntry"}
	msysEnvFile = "$($msysFiles.msysDotfilesGitDir)\.msysEnv" || ($env:myDotfiles) ? `
	    ("$env:myDotfiles\msys2\.msysenv") : (Write-Error "Something is wrong")
    }
}

# ImportantHash hash table
# EXPERIMENTAL: This is for testing nested hash tables

$ImportantHashHash = @{
    backupDirs = $backupDirs
    newDocDirs = $newestDocumentDirs
}

$ImportantHashArr = @($backupDirs, $newestDocumentDirs)

$newestDocumentDirs.Add("json_data_learning", "$PWD")
function importmshash { 
    $mstools = @{
	msbuild = $msbuild
	dotnet = @{
	    dotnetexe = "C:\Program Files\dotnet\dotnet.exe"
	    dotnetdir = $dotnetDir
	}
    }
    return $mstools
}

$mstools = importmshash
