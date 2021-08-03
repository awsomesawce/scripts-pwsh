# More awesome class functionality

class MyClass {
    [string]$Dir

    [string] GetDir(){
        return $this.Dir.Replace('/', '\')
    }
    [System.String] GetDirContents() {
        # Using Type Literals inside a class
        return [system.io.directory]::GetFileSystemEntries($this.GetDir())
    }
}

$newthing = [MyClass]::new()
$newthing.Dir = "$env:USERPROFILE/test"
$newthing.GetDir()
$newthing.GetDirContents()

$newthing
