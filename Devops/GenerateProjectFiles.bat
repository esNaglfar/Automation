@ECHO OFF

set UBT="%REZORIN_ENGINE%\Engine\Binaries\DotNET\UnrealBuildTool\UnrealBuildTool.exe"
set UVS="C:\Program Files (x86)\Epic Games\Launcher\Engine\Binaries\Win64\UnrealVersionSelector.exe"

set PROJECT="U:\Unreal Projects\Rezorin\Rezorin"

%UVS% /projectfiles %PROJECT%.uproject
%UBT% Development Win64 -Project=%PROJECT%.uproject -TargetType=Editor -Progress -NoEngineChanges -NoHotReloadFromIDE

%PROJECT%.uproject
%PROJECT%.sln

PAUSE