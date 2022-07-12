"""
Imports package that starts Excel process (using xlwings), gets interface
to the object wrapper for the Excel model, and then serves requests to that model.
"""
import os
import sys
from multiprocessing.connection import Listener

_file_path = os.path.dirname(os.path.abspath(__file__))
sys.path.append(_file_path)
from excel_object_wrapper import Model

_MODEL_FILENAME = 'get_TM1Buttons.xlsm'
model_interface = Model(os.path.join(_file_path, _MODEL_FILENAME))
model_interface.run()

_port = sys.argv[1]
address = ('localhost', int(_port))
listener = Listener(address)

_alive = True

print('starting server on ' + str(address))
while _alive:
    print("listening for connections")
    conn = listener.accept()
    print('connection accepted from', listener.last_accepted)

    while True:
        try:
            input = conn.recv()
            print(input)
            if not input or input == 'close':
                print('closing connection to ' + str(conn))
                model_interface.close()
                conn.close()
                break

            if input == 'kill':
                _alive = False
                print('stopping server')
                model_interface.close()
                conn.send('model closed')
                conn.close()
                listener.close()
                break
        except EOFError:
                print('closing connection to ' + str(conn))
                conn.close()
                break
        conn.send(model_interface.find_button(input))