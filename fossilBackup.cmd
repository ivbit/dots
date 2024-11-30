@ECHO OFF
ECHO/
ECHO/Резервное копирование файла репозитория Fossil.
ECHO/%1
fossil test-integrity %1
IF ERRORLEVEL 1 GOTO :ERROR1
ECHO/Проверка целостности завершена успешно.
COPY %1 ..\fossilBackup\
IF ERRORLEVEL 1 GOTO :ERROR2
ECHO/Копирование завершено успешно.
ECHO/
GOTO :EOF
:ERROR1
ECHO/*** ОШИБКА ПРОВЕРКИ ЦЕЛОСТНОСТИ РЕПОЗИТОРИЯ ***
ECHO/
GOTO :EOF
:ERROR2
ECHO/*** ОШИБКА КОПИРОВАНИЯ ФАЙЛА ***
ECHO/

