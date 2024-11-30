@ECHO OFF
REM Make desktop shortcut:
REM %COMSPEC% /K C:\fossil\fossilInit.cmd
REM In the properties of a fossil desktop shortcut, set working directory to
REM the working directory of the current project.
PATH %PATH%;C:\fossil
ECHO/Fossil initialization successful.
>NUL CHCP 65001

