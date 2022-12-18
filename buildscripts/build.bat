rem Run this from an empty folder which is to represent the built distribution

call %~dp0\set_path_variables

echo "Copying source xslt files"
xcopy %DOCSRC%\xslt xslt\ /q

echo "Copy ERmodel.functions.module.xslt"
copy %ERHOME%\xslt\ERmodel.functions.module.xslt xslt\ERmodel.functions.module.xslt

echo "Copy css files"
if not exist docs mkdir docs
REM DONT NEED css files because styles bundled into the html and svg files ?
REM copy %DOCSRC%\css\erstyle.css docs\erstyle.css
REM copy %DOCSRC%\css\cssmenustyles.css docs\cssmenustyles.css

echo "Copying command files"
xcopy %DOCSRC%\commands commands\ /q

rem used to have here call %~dp0\gen_downgrade_to_v1.3.bat %DOCSRC%\xml\documentERModel.xml

powershell %ERHOME%\scripts\genSVG.ps1 %DOCSRC%\xml\documentERModel.xml -outputFolder docs -bundle

call %~dp0\generate_physical_model %DOCSRC%\xml\documentERModel.xml