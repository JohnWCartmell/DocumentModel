
call %~dp0\set_path_variables

set filepath=%~dp1
set filename=%~nx1
set filenamebase=%filename:~0,-4%

call %~dp0\set_path_variables

java -jar %SAXON_PATH%\saxon9he.jar -s:temp\%filenamebase%.xml -xsl:%ERXSLT%/ERmodel2.physical.xslt -o:temp\%filenamebase%.physical.xml style=hs

java -jar %SAXON_PATH%\saxon9he.jar -s:temp\%filenamebase%.physical.xml -xsl:%ERXSLT%/ERmodel_v1.3_to_ERmodel_v1.4.xslt -o:xml\%filenamebase%.physical.xml

java -jar %SAXON_PATH%\saxon9he.jar -s:temp\%filenamebase%.physical.xml -xsl:%ERXSLT%/ERmodel2.rng.xslt -o:schemas\%filenamebase%.rng

java -jar %SAXON_PATH%\saxon9he.jar -s:temp\%filenamebase%.physical.xml -xsl:%ERXSLT%/ERmodel2.elaboration_xslt.xslt -o:xslt\%filenamebase%.elaboration.xslt

java -jar %SAXON_PATH%\saxon9he.jar -s:xml\%filenamebase%.physical.xml -xsl:%ERXSLT%/ERmodel2.referential_integrity_xslt.xslt -o:xslt\%filenamebase%.referential_integrity.xslt

java -jar %SAXON_PATH%\saxon9he.jar -s:temp\%filenamebase%.physical.xml -xsl:%ERXSLT%/ERmodel2.svg.xslt -o:docs/ERmodel.physical.svg filestem=ERmodel.physical noscopes=y
