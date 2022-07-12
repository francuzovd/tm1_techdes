echo 'Installing a database'
./venv/bin/python manage.py makemigrations
./venv/bin/python manage.py migrate
echo 'Database installed successful'

echo 'Creating an admin user'
./venv/bin/python manage.py createsuperuser --username admin --email ''
echo 'Admin user created successful'

echo 'Run Excel server'
./venv/bin/python ExcelServer/start_server.py 6000 './Logs/ExcelServer.log'

echo 'Run web application'
./venv/bin/python manage.py runserver
open http://localhost:8000
