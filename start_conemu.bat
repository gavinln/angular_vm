set SCRIPTS_DIR=%~dp0scripts

REM echo %SCRIPTS_DIR%\conemu_setup.txt
REM conemu64 /cmd @%SCRIPTS_DIR%\conemu_setup.txt

conemu64 /cmdlist vagrant ssh clone -new_console ^|^|^| vagrant ssh clone -new_console:sv
