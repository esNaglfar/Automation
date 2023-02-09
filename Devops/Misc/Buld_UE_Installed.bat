@echo off

set UE_SOURCES_PATH=D:\UnrealEngines\Sources\5.1\
set UE_BUILD_DIR=D:\UnrealEngines\Binaries\5.1\
        

        echo UE_BUILD_DIR - %UE_BUILD_DIR% 
        echo UE_SOURCES_PATH - %UE_SOURCES_PATH%


                "%UE_SOURCES_PATH%Engine\Build\BatchFiles\RunUAT.bat" ^
                BuildGraph ^
                -target="Make Installed Build Win64" ^
                -script="%UE_SOURCES_PATH%Engine\Build\InstalledEngineBuild.xml" ^
                -clean ^
                -TargetPlatforms=Win64 ^
                -set:HostPlatformOnly=true 
                -set:WithClient=true 
                -set:WithServer=true 
                -set:WithFullDebugInfo=true 
                -set:BuiltDirectory=%UE_BUILD_DIR%