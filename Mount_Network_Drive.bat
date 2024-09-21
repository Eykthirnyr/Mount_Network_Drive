@echo off
setlocal

:: Variables
set DRIVE_LETTER=K:
set NAS_IP=192.168.121.104
set SHARE_NAME=scan
set USERNAME=enduser
set PASSWORD=greuyhergyhvrfeh

:: Check if the NAS is reachable
ping -n 1 %NAS_IP% >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: NAS at IP %NAS_IP% is not reachable. Please check the connection.
    exit /b 1
)

:: Check if the drive letter is valid
echo List of valid drive letters:
wmic logicaldisk get name
echo Checking if drive letter %DRIVE_LETTER% is valid...
if exist %DRIVE_LETTER%: (
    echo Error: Drive letter %DRIVE_LETTER% is already in use. Please choose another one.
    exit /b 2
)

:: Check if the Workstation service is running (required for network shares)
sc query workstation | findstr /I "RUNNING" >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: Workstation service is not running. Please start the service and try again.
    exit /b 3
)

:: Check if the network is accessible
net use >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: Network services are not available. Please check your network settings.
    exit /b 4
)

:: Check if the drive is already mounted
if exist %DRIVE_LETTER%\ (
    echo Drive %DRIVE_LETTER% is already mounted.
    exit /b 0
)

:: Attempt to mount the network drive
echo Attempting to mount network drive...
net use %DRIVE_LETTER% \\%NAS_IP%\%SHARE_NAME% /user:%USERNAME% %PASSWORD% /persistent:yes

:: Check if the command was successful
if %errorlevel% == 0 (
    echo Successfully mounted %SHARE_NAME% on %DRIVE_LETTER%.
) else (
    echo Error: Failed to mount %SHARE_NAME% on %DRIVE_LETTER%. Checking for potential issues...

    :: Check if authentication failed
    net use %DRIVE_LETTER% >nul 2>&1
    if %errorlevel% == 5 (
        echo Error: Authentication failed. Please verify the username and password.
        exit /b 5
    )

    :: Check if the share path is correct
    if %errorlevel% == 53 (
        echo Error: The network path was not found. Please verify the IP address and share name.
        exit /b 6
    )

    :: Check if access was denied
    if %errorlevel% == 85 (
        echo Error: The drive letter %DRIVE_LETTER% is already in use by another share. Please unmount it first.
        exit /b 7
    )

    :: General failure
    echo Unknown error occurred. Please check the system logs or try again later.
    exit /b 8
)

endlocal
