# CMake Guide

CMake is an open-source, cross-platform family of tools designed to build, test and package software. CMake is used to control the software compilation process using simple platform and compiler independent configuration files, and generates native makefiles and workspaces that can be used in the compiler environment of your choice.

## Requirement

1. Open your terminal and execute:
  ```sh
  cmake --version
  ```
if the CMake version is lower than 3.6, please upgrade.

2. You should use __out-of-source__ builds, this means you need to create a different directory than __cocos2d-x__ to execute the `cmake` command.

## Step by Step

### Linux

```sh
cd dltest
mkdir linux-build && cd linux-build
cmake ..
make
``` 

Execute `make help` to see all build targets, `make <target>` build specified target

### Generate Visual Studio projects

```sh
cd dltest
mkdir win32-build && cd win32-build
cmake .. -G"Visual Studio 15 2017" -Tv141
```

Execute `cmake --build .` to compile,
```
cmake --build . --config Debug
cmake --build . --config Release
```
or open __Cocos2d-x.sln__ in Explorer to use the generated project. 

If can't found `MSVCR110.dll` issue occurs to you, please install this [Visual C++ Runtime Libraries](https://www.microsoft.com/en-us/download/details.aspx?id=30679), when runing the cpp-tests project

### Generate macOS Project

```sh
cd dltest
mkdir mac-build && cd mac-build
cmake .. -GXcode
open dltest.xcodeproj
```

### Generate iOS Project

```sh
cd dltest
mkdir ios-build && cd ios-build
cmake .. -GXcode -DCMAKE_SYSTEM_NAME=iOS -DCMAKE_OSX_SYSROOT=iphoneos
open dltest.xcodeproj
```
