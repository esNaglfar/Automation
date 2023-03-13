@echo ON

set PROJECT_NAME="Rezorin"

cd..
cd..
cd Content

mkdir "00_"%PROJECT_NAME%"Content"
mkdir "01_"%PROJECT_NAME%"Settings"

set maincontent="00_"%PROJECT_NAME%"Content"
set settings="01_"%PROJECT_NAME%"Settings"


cd %maincontent%

mkdir "00_Levels"
cd "00_Levels"
mkdir "Test_Levels"
mkdir "GameLevels"
cd..

mkdir "01_Blueprints"
cd "01_Blueprints"
mkdir "Characters"
mkdir "Structs"
mkdir "Enums"
mkdir "Triggers"
mkdir "SFX"
mkdir "VFX"
mkdir "Components"
cd..

mkdir "02_UMG"
mkdir "03_Animations"
mkdir "04_Sounds"
mkdir "05_Meshes"
mkdir "06_Images"
mkdir "07_Libs"
mkdir "99_GameStatics"

cd..
cd %settings%

mkdir "DataTables"


PAUSE
