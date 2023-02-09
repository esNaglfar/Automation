@echo off
FOR /R %%f IN (*.cs, *.h, *.cpp)
DO(
   clang-format -i %%f
)
PAUSE 