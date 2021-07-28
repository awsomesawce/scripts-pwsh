#!pwsh -noprofile
# Extra Python var hash
# INFO: There are 2 Python3.8s installed on Windows (not including msys/cygwin)
# One is the officially installed bundle version, the other
# is the Windows Store installed version.
# The Windows Store version is in ~/AppData/Local,
# The officially installed bundle is in C:\Program Files\Python38 and
# is more comprehensive than the Windows Store version.
#

# TODO Add this to separate script file:
# pythondirs {{{
$PythonDirListHash = @{
    Python38 = @{
	InLocalAppData = "C:\Users\Carl\AppData\Local\Packages\PythonSoftwareFoundation.Python.3.8_qbz5n2kfra8p0\LocalCache\local-packages\Python38\Scripts"
	InProgramFiles = "C:\Program Files\Python38\Scripts"
	InAppData = "D:\Carl\AppData\Python\Python38\Scripts"
	InProgramFilesTools = "C:\Program Files\Python38\Tools"
	Win32Api = "C:\Users\Carl\AppData\Local\Packages\PythonSoftwareFoundation.Python.3.8_qbz5n2kfra8p0\LocalCache\local-packages\Python38\site-packages\win32"
    }
    Python39 = @{
	Exes = @{
	    Idle39 = "C:\Users\Carl\AppData\Local\Microsoft\WindowsApps\idle3.9.exe"
	    Python39 = "C:\Users\Carl\AppData\Local\Microsoft\WindowsApps\python3.9.exe"
	    Pip39 = "C:\Program Files\WindowsApps\PythonSoftwareFoundation.Python.3.9_3.9.1520.0_x64__qbz5n2kfra8p0\pip3.9.exe"
	}
	InProgramFiles = "C:\Program Files\WindowsApps\PythonSoftwareFoundation.Python.3.9_3.9.1520.0_x64__qbz5n2kfra8p0\python3.9.exe"
    }
}
# }}}
