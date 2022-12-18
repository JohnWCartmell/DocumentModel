
echo off

set ERSCRIPT=ERScript_r5

set DOCSRC=%~dp0..
 
if exist %ERSCRIPT% (
  call %ERSCRIPT%\commands\set_path_variables.bat
  goto erscriptfound
)  
if exist ..\%ERSCRIPT% (
  call ..\%ERSCRIPT%\commands\set_path_variables.bat
  goto erscriptfound
)  
if exist ..\..\%ERSCRIPT% (
  call ..\..\%ERSCRIPT%\commands\set_path_variables.bat 
  goto erscriptfound
)
if exist ..\..\..\%ERSCRIPT% (
  call ..\..\%ERSCRIPT%\commands\set_path_variables.bat
  goto erscriptfound
)

echo For this command need folder %ERSCRIPT% - see readme.
exit /b 1

:erscriptfound








