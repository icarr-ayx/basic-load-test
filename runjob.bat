@echo off

REM SERVER SETTINGS
set "host=localhost:80"
set "secret=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
set "alteryx_service=C:\Program Files\Alteryx\bin\alteryxservice.exe"

REM FILE SETTINGS
set "working_dir=C:\temp"
set "work_module=work.yxmd"
set "last_module=last.yxmd"
set "last_file=done.csv"

REM NUMBER OF JOBS TO ADD TO QUEUE
set jobs=25


set STARTTIME=%TIME%
set num=1

:addjobtoqueue
IF %num% LEQ %jobs% (
    ECHO adding job (%num%^) to queue
    "%alteryx_service%" addtoqueue="%working_dir%\%work_module%",%host%,%secret%
    set /a num+=1
    GOTO addjobtoqueue
)

REM add a job to the queue that creates a temp file indicating that we are finished (done.csv)
"%alteryx_service%" addtoqueue="%working_dir%\%last_module%",%host%,%secret%

:waittilldone
IF NOT EXIST "%working_dir%\%last_file%" (
TIMEOUT /t 1 /nobreak
GOTO waittilldone
)

set ENDTIME=%TIME%

REM delete the temp file created by the last job
del "%working_dir%\%last_file%"

echo START: %STARTTIME%
echo END:   %ENDTIME%