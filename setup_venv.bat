@echo off

:: Set the virtual environment name
set VENV_NAME=venv

:: Check if the venv directory exists
if exist %VENV_NAME%\Scripts\activate (
    echo Virtual environment already exists.    
) else (
    :: Create the virtual environment
    python -m venv %VENV_NAME%
)

call %VENV_NAME%\Scripts\activate

:: Check if the virtual environment is active
if defined VIRTUAL_ENV (
    echo Virtual environment is already active.
    :: Upgrade pip
    %VENV_NAME%\Scripts\python -m pip install --upgrade pip

    :: Check if requirements.txt exists and install dependencies
    if exist requirements.txt (
        %VENV_NAME%\Scripts\python -m pip install -r requirements.txt
    ) else (
        echo requirements.txt file not found.
    )
) else (
    echo Virtual environment is not active.
    :: Activate the virtual environment
    echo Before run this file activate the virtual environment, run:
    echo     %VENV_NAME%\Scripts\activate
    echo or, for PowerShell:
    echo     %VENV_NAME%\Scripts\Activate.ps1
)

:: Final message
echo Virtual environment setup is complete.
