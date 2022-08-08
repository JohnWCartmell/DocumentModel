call %~dp0\set_path_variables

echo "Copying source xslt files"
xcopy %DOCSRC%\xslt xslt\ /q

echo "Copy ERmodel.functions.module.xslt"
copy %ERHOME%\xslt\ERmodel.functions.module.xslt xslt\ERmodel.functions.module.xslt

echo "Copy css files"
copy %DOCSRC%\css\erstyle.css docs\erstyle.css
copy %DOCSRC%\css\cssmenustyles.css docs\cssmenustyles.css

echo "Copying command files"
xcopy %DOCSRC%\commands commands\ /q

call %~dp0\gen_downgrade_to_v1.3.bat %DOCSRC%\xml\documentERModel.xml

call %~dp0\genSvg.bat %DOCSRC%\xml\documentERModel.xml

call %~dp0\generate_physical_model %DOCSRC%\xml\documentERModel.xml