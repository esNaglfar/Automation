@echo off

set UE_SOURCES_PATH="U:\UnrealEngine\"
set UE_BUILD_DIR="U:\UE_Engine_InstalledBuild\"
        

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

        pause