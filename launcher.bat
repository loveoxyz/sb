@echo off
cls

@REM REM Prompt the user to enter a list of IDs and thier token
@REM echo Enter your user account token:
@REM set /p token=
@REM echo Enter a comma-separated list of channel IDs to spam (e.g., id1, id2, id3):
@REM set /p ids=

@REM REM Convert to JSON array
@REM set ids=%ids:,=,%
@REM set json_ids=%ids%

@REM REM JSON data for settings.json
@REM set settings={"token": "%token%", "spam_channels": [%json_ids%]}

@REM REM Writing json data
@REM echo %settings% > settings.json

@REM echo Config File Saved! 

echo Running selfbot now!
py -3 selfbot.py
pause