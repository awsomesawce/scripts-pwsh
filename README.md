# scripts-pwsh

## Directories

- `./old`: old stuff

## 10-29

Working with pwsh inside code is great in that it has a bunch of options and features, but it takes up a ton of memory.  The integrated Powershell console doesn't have the prompt theme that default profile has.
Also, syntax highlighting for raw markdown inside code is gone for some reason.  Why is this the case?  I'd rather edit markdown files inside Kate but that will take up another 100MBs of memory that I'd rather not take up!.......

## Update 10/27

I've added the `*.*~` files to `.gitignore`.  `vim` creates these weird backup files whenever I edit a file with it.

### They're useless so I've set them to be ignored in `git`

This git repo contains my personal collection of **Powershell** and **Bash** shell scripts.

But it also includes batch files which are a little similar to `.ps1` files.

The `gotosleep.bat` file had been created and linked to a custom task using `taskscheduler` on windows.  

## Personal Update

I have been messing around with ConEmu's many settings and features and I've come across a wonderful functionality that
allows for you to create your own startup tasks which you can invoke while in a ConEmu64 session.  I can also make a `.bat`
file to open multiple programs into my specified directory, like for instance a git repo directory I'm currently working in.

Another great feature is the ability to embed or "attach" an external program into ConEmu.  This works with literally every
program I've tried to use it with.  But if you get ambitious like I did and try attaching a **Firefox** session that has 10 tabs open, you're bound to crash the program, which is exactly what happened.

Anyway I'm working on creating a batch file or shortcut that opens ConEmu with all the tabs and panes I want and in the correct directory.  It will be wonderful.  Automation is awesome!
