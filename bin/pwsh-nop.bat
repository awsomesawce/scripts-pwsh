@echo off

@rem "This is a test"
:: I'm not sure what this will do.
:: TODO:  <26-03-21, Carl> ::
:: Figure out how to best do this.  Look
:: at Strawberry Perl examples.
set PAGER=less
set EDITOR=notepad
@rem wt.exe new-tab cmd.exe 
@start wt new-tab pwsh -noprofile
:: Explanation {{{ ::
@rem cmd.exe commands are case-insensitive, unlike Linux/Unix commands.
@rem To differentiate windows commands from similar linux commands, 
@rem it is often useful to use the all caps ECHO in batch scripts,
@rem since ECHO is not a valid way to call linux's echo and won't work.
@rem START https://duckduckgo.com
@rem https://github.com
:: }}} Explanation ::
@ECHO ----------------------------------------------
@ECHO     Welcome to Windows Powershell!
@ECHO         Please enjoy your stay!
@ECHO      PAGER is set to %PAGER%
@ECHO      EDITOR is set to %EDITOR%
@ECHO ----------------------------------------------
