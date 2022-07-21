@echo off
cd /D "%~dp0"
echo 'Installing a database'
".\venv\Scripts\python.exe" manage.py makemigrations
".\venv\Scripts\python.exe" manage.py migrate
echo 'Database installed successful'

echo 'Creating an admin user'
".\venv\Scripts\python.exe" manage.py createsuperuser --username admin --email ''
echo 'Admin user created successful'

echo 'Run Excel server'
".\venv\Scripts\python.exe" ExcelServer/start_server.py 6000 './Logs/ExcelServer.log'

echo 'Run web application'
start http://localhost:8000
".\venv\Scripts\python.exe" manage.py runserver

pause
