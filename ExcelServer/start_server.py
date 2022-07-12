"""
Starts spreadsheet server on specified port

Usage: python start_server.py port_number logging_filepath
    port_number: sets server listening to localhost:<port_number>
    logging_filepath: full path to logging file (all messages directed to this file)
"""

import argparse
import os
import subprocess

_file_path = os.path.dirname(os.path.abspath(__file__))

#command line interface
parser = argparse.ArgumentParser()
parser.add_argument(
    'port_number',
    help='sets server listening to localhost:<port_number>')

parser.add_argument('logging_filepath', help='full path to logging file (all messages directed to this file)')
args = parser.parse_args()

#set up logging
_logging_path = args.logging_filepath
print("logging output to " + _logging_path)
_log = open(_logging_path, 'wb')

#set up and start server
_port = args.port_number
print('starting Excel server...')
subprocess.Popen(['venv/bin/python3', _file_path + '/server.py', str(_port)], stdin=_log, stdout=_log, stderr=_log)
print("".join(['server listening on localhost:', str(_port)]))