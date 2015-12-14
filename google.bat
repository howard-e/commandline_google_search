@echo off
rem @author Howard Edwards

rem google.bat ~ Using Google's search engine to perform a web search or to open a web address directly
rem Usage: google <query>
rem Usage: cmd //c google <query> (with default Git Bash installation options on Windows)

if not "%1"=="" (set QUERY=%1) else (goto error)
if not %QUERY:.com=% == %QUERY% (goto url) else (goto org)

:org
if not %QUERY:.org=% == %QUERY% (goto url) else (goto net)

:net
if not %QUERY:.net=% == %QUERY% (goto url) else (goto gov)

:gov
if not %QUERY:.gov=% == %QUERY% (goto url) else (goto edu)

:edu
if not %QUERY:.edu=% == %QUERY% (goto url) else (goto loop)

:url
start http://www.%QUERY%
exit

:loop
shift
if not "%1"=="" (set QUERY=%QUERY%+%1) else (goto exitloop)
goto loop
:exitloop
start http://www.google.com/search?q=%QUERY%
exit

:error
echo "Usage:: google <query>"
exit