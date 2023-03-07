import os, fnmatch
import xml.etree.ElementTree as ET


### SETTINGS ###

TargetVersion = 'v4.8'

FilesToCheck = [
    'SwarmCoordinator.csproj',
]

VersionsToReplace = [
    'v4.5',
    'v4.5.2',
]

VersionsToCheck = [
    'v4.0'
]

UE_SOURCE_PATH = r"U:\UnrealEngine\UnrealEngine"

###################################################################
def GetValue(line):
    
    return line.split('>')[1].split('<')[0]

def FindAllFiles(directory, fileext):
    result = []
    for root, dirs, files in os.walk(directory):
        for name in files:
            if fnmatch.fnmatch(name, fileext):
                result.append(os.path.join(root, name))
    return result


def CheckFile(filepath):
    if(os.path.basename(filepath) in FilesToCheck):
        print(filepath)
    file = open(filepath, 'r')
    lines = file.readlines()
    for line in lines:
        if("TargetFrameworkVersion" in line and GetValue(line) in VersionsToCheck):
            print("interesting version - ", GetValue(line), " - detected in : ", os.path.basename(filepath))

        if("<TargetFrameworkVersion>" in line and GetValue(line) in VersionsToReplace):
            file.close()
            return [1,line]
            
    file.close()
    return [0,'none']


def ModifyFile(filepath):
    newfilePath = os.path.dirname(filepath)
    newFileName = 'NEW_' + os.path.basename(filepath)
    newFile = os.path.join(newfilePath,newFileName)
    print(newFile)
    with open(filepath, 'r') as input:
        with open(newFile, 'w') as output:
            for line in input:
                for version in VersionsToReplace:
                    line = line.replace(version,TargetVersion)
                output.write(line)
    os.replace(newFile,filepath)    
###################################################################################    

### Старт тут ###---------------------------------------------
rowcount = 0

filePathList = FindAllFiles(UE_SOURCE_PATH,"*.csproj")

filesToModify = []
versions = []

print("Checking files...")

for filepath in filePathList:
    result = CheckFile(filepath)
    if(result[0] == 1):
        filesToModify.append(filepath)
        rowcount += result[0]
        if(result[1] not in versions):
            versions.append(result[1])



print("Modifying files...")

for file in filesToModify:
    ModifyFile(file)


