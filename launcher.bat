@echo off
cls

REM Prompt the user to enter a list of IDs and thier token
echo Enter your user account token:
set /p token=
echo Enter a comma-separated list of channel IDs to spam (e.g., id1, id2, id3):
set /p ids=

REM Convert to JSON array
set ids=%ids:,=,%
set json_ids=%ids%

REM JSON data for settings.json
set settings={"token": "%token%", "spam_channels": [%json_ids%]}

REM Writing json data
echo %settings% > settings.json

echo Config File Saved! 

echo Running selfbot now!
py -3 selfbot.py
pause