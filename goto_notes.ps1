# This is a quick script that will allow me to go to my notes folder in powershell
set-location -path "D:\Carl\Onedrive\Notable\Notes" -PassThru
date >> from_code.md
echo "Here's a new note made from the terminal" >> from_code.md
code from_code.md