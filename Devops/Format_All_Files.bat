@echo off
echo start formating ...
echo ----
cd ../Source
for /R %%x in (*.cs, *.cpp, *.h) do (
   echo %%x
)
echo ----
echo formating finished ...