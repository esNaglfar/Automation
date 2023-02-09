@echo off

set ProjectRoot=d:\UE_Projects\Rezorin\

pushd %ProjectRoot%
rmdir /s /q %ProjectRoot%\Documentation
doxygen %ProjectRoot%/DevOps/Docs/DoxyFile
start "" %ProjectRoot%\Documentation\html\index.html
popd %ProjectRoot%