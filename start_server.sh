echo 'Run Excel server'
./venv/bin/python ExcelServer/start_server.py 6000 './Logs/ExcelServer.log'

echo 'Run web application'
./venv/bin/python manage.py runserver
open http://localhost:8000