@echo off

cd ..\..\
md build\output

::set /p build_article=you want build which article:

set build_article=tbrw2_app_optimization

if "%build_article%"=="extension_framework" (
	echo build extension_framework article
	set build_extension_framework_article=yes
)

if "%build_article%"=="ppapi" (
	echo build ppapi article
	set build_ppapi_article=yes
)

if "%build_article%"=="tbrw2_app_optimization" (
	echo build tbrw2_app_optimization article
	set build_tbrw2_app_optimization_article=yes
)

if defined build_extension_framework_article (
	xelatex -synctex=1 -interaction=nonstopmode -output-directory=build/output "\input{./articles/extension_framework.tex}"
	copy /Y  build\output\extension_framework.pdf out\
)

if defined build_ppapi_article (
	xelatex -synctex=1 -interaction=nonstopmode -output-directory=build/output "\input{./articles/ppapi.tex}"
	copy /Y  build\output\ppapi.pdf out\
)

if defined build_tbrw2_app_optimization_article (
	xelatex -synctex=1 -interaction=nonstopmode -output-directory=build/output "\input{./articles/tbrw2_app_optimization.tex}"
	copy /Y  build\output\tbrw2_app_optimization.pdf out\
)
cd build\win

