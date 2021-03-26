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
:: Testfold {{{ ::
:: }}} Testfold ::
@rem "cmd.exe commands can be all caps or not"
@rem To differentiate windows commands from similar linux commands, 
@rem it is often useful to use the all caps ECHO in batch scripts,
@rem since ECHO is not a valid way to call linux's echo and won't work.
@rem START https://duckduckgo.com
@rem https://github.com
@rem ----------------------------------------------
@rem     Welcome to Windows Powershell!
@rem         Please enjoy your stay!
@rem      PAGER is set to %PAGER%
@rem      EDITOR is set to %EDITOR%
@rem ----------------------------------------------
