@echo off
cd /D "%~dp0"

echo 'Run Excel server'
".\venv\Scripts\python.exe" ExcelServer/start_server.py 6000 './Logs/ExcelServer.log'

echo 'Run web application'
start http://localhost:8000
".\venv\Scripts\python.exe" manage.py runserver

pause