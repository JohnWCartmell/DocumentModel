@echo off

set filepath=%~dp1
set filename=%~nx1
set filenamebase=%filename:~0,-4%

call %~dp0\set_path_variables

java -jar %SAXON_PATH%\saxon9he.jar -s:temp\%filenamebase%.xml -xsl:%ERHOME%\xslt\ERmodel2.svg.xslt -o:docs\%filenamebase%.svg filestem=%filenamebase% 