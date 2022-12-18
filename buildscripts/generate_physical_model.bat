
call %~dp0\set_path_variables

set filepath=%~dp1
set filename=%~nx1
set filenamebase=%filename:~0,-4%

call %~dp0\set_path_variables

java -jar %SAXON_JAR% -s:%DOCSRC%\xml\%filenamebase%.xml -xsl:%ERXSLT%/ERmodel2.physical.xslt -o:xml\%filenamebase%.physical.xml style=hs

java -jar %SAXON_JAR% -s:xml\%filenamebase%.physical.xml -xsl:%ERXSLT%/ERmodel2.rng.xslt -o:schemas\%filenamebase%.rng

java -jar %SAXON_JAR% -s:xml\%filenamebase%.physical.xml -xsl:%ERXSLT%/ERmodel2.elaboration_xslt.xslt -o:xslt\%filenamebase%.elaboration.xslt

java -jar %SAXON_JAR% -s:xml\%filenamebase%.physical.xml -xsl:%ERXSLT%/ERmodel2.referential_integrity_xslt.xslt -o:xslt\%filenamebase%.referential_integrity.xslt

powershell %ERHOME%\scripts\genSVG.ps1 xml\%filenamebase%.physical.xml -outputFolder docs -bundle

rem java -jar %SAXON_JAR% -s:xml\%filenamebase%.physical.xml -xsl:%ERXSLT%/ERmodel2.svg.xslt -o:docs/ERmodel.physical.svg filestem=ERmodel.physical noscopes=y
