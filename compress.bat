echo off
setlocal DISABLEDELAYEDEXPANSION
set "HELPER="
SET HELPER=^^!
@REM echo %HELPER%


setlocal enabledelayedexpansion

:: Name of the configuration file
:: when the path contains space, the batch file cannot read it, just sets the part before the space and ignores everything else.
:: by using 'type <string>', when using the saved path in CONFIG_FILE the batch file can correctly interpret the path even with spaces.
set CONFIG_FILE='type "compress config.txt"'
echo %CONFIG_FILE%

:: --- Read Configuration from File ---
echo Reading configuration from %CONFIG_FILE%...

::declaring variables to save the settings of the config file to
::if equality sign isn't present, then it will just treat the written line as a string value and not as a variable
set _7Z_PATH=
set PROJECT_NAME=
set PROJECT_VERSION=
set OUTPUT_DIRECTORY=
set FILES_TO_COMPRESS=
set EXCLUDE_FILES=
set COMPRESSION_METHOD=

::for /f means the cycle will execute the 'do ()' part for each line for the file specified in 'in ()'
::delims mean what caracter is used to separate the data. syntax is delims=<char>. in this example, it's '=' .
::tokens assign the line's split values. In this example, the part before the first '=' is going to be assigned (within a cycle) to %%a and everything else to %%b.
::the syntax is the following: for every value that you got by splitting a line, you can assign a temporal variable (which is automatically present in a for loop).
::the first number you write into the token part will be assigned to %%a, the second number will be to %%b and so on.
::for example, tokens=2,5 will mean that a line split with delims=<char> will assign the 2nd part (token) to %%a and the 5th part to %%b.
::if you put a '*' at the end of the tokens==, it will assign all remaining parts after the last used one to the next avaliable letter.
::so for example if you wrote tokens==2,5* would mean to do all the things written in the example plus assign everything after the 5th part to %%c.
for /f "tokens=1,* delims==" %%a in (%CONFIG_FILE%) do (
    echo.
    echo %%a
    echo %%b
    echo.
    
    set "var_name=%%a"
    set "var_value=%%b"

    ::the quotation marks are only necessary when comparing, but not when setting.
    if /i "!var_name!"=="_7Z_PATH" (
        set _7Z_PATH=!var_value!
    ) else if /i "!var_name!"=="PROJECT_NAME" (
        set PROJECT_NAME=!var_value!
    ) else if /i "!var_name!"=="PROJECT_VERSION" (
        set PROJECT_VERSION=!var_value!
    ) else if /i "!var_name!"=="OUTPUT_DIRECTORY" (
        set OUTPUT_DIRECTORY=!var_value!
    ) else if /i "!var_name!"=="FILES_TO_COMPRESS" (
        set FILES_TO_COMPRESS=!var_value:"=°!
    ) else if /i "!var_name!"=="EXCLUDE_FILES" (
        set EXCLUDE_FILES=!var_value!
    ) else if /i "!var_name!"=="COMPRESSION_METHOD" (
        set COMPRESSION_METHOD=!var_value!
    )
)


@REM echo Set value debug

@REM echo %_7Z_PATH%
@REM echo %PROJECT_NAME%
@REM echo %PROJECT_VERSION%
@REM echo %OUTPUT_DIRECTORY%
@REM echo %FILES_TO_COMPRESS%
@REM echo %EXCLUDE_FILES%
@REM echo %COMPRESSION_METHOD%

::

::setting the output archive name. it needs to be done in 2 lines because otherwise double quotation marks would appear at the end of each line
set OUTPUT_ARCHIVE_NAME=!PROJECT_NAME! !PROJECT_VERSION!
echo %OUTPUT_ARCHIVE_NAME%

mkdir %OUTPUT_DIRECTORY%

set FULL_OUTPUT_ARCHIVE_PATH=!OUTPUT_DIRECTORY!/!OUTPUT_ARCHIVE_NAME!.!COMPRESSION_METHOD!
echo %FULL_OUTPUT_ARCHIVE_PATH%

::constructing the command as 7z.exe path + 'a' (add keyword for 7zip) + compression method + output + files to include
::setting and adding strings litters everything with quotation marks. all of them will be deleted but where we really do 
::need them, '°' is added and they will be converted to the only quotation marks.
set _7Z_COMMAND=°!_7Z_PATH!° a -t!COMPRESSION_METHOD! °!FULL_OUTPUT_ARCHIVE_PATH!° !FILES_TO_COMPRESS!
@REM echo %_7Z_COMMAND%

if defined EXCLUDE_FILES (
    @REM echo "lefutok"
    for %%f in (!EXCLUDE_FILES!) do (
        set _7Z_COMMAND=!_7Z_COMMAND! -x^^%HELPER%°%%f°
        @REM echo "inner"
    )
)

@REM echo %_7Z_COMMAND%


set _7Z_COMMAND=!_7Z_COMMAND:"=!
set _7Z_COMMAND=!_7Z_COMMAND:°="!

@REM echo !_7Z_COMMAND!

!_7Z_COMMAND!

echo.
pause
endlocal