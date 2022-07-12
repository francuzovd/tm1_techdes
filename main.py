import os
from glob_var import *
from import_doc import create_doc
from tm1parser import TM1AppParser, TM1ProcessParser
import pathlib
import subprocess
from multiprocessing.connection import Client

def run_techdes(app_path, doc_path, config):

    if isinstance(app_path, str):
        app_path = list(app_path)

    # TODO use only one path to create doc

    # description = {
    #     'dimension': DESC_DIM,
    #     'cube': DESC_CUBE,
    #     'process': DESC_PRO
    # }
    #
    description = {
        'dimension': config['desc_dim'],
        'cube': config['desc_cube'],
        'process': config['desc_pro'],
        'cubedim': config['dim_file']
    }

    # start Excel App as server to parse Pax Forms with vba
    # ExcelServer_log = open('./Logs/ExcelServer.log', 'wb')
    xlx_port = 6000
    if os.name == 'nt':
        subprocess.Popen(
            ['venv/bin/python3', './ExcelServer/start_server.py', str(xlx_port), './Logs/ExcelServer.log'],
            # stdin=ExcelServer_log, stdout=ExcelServer_log, stderr=ExcelServer_log
        )

    # try:
    #     xlx_server_ = Client(('localhost', xlx_port))
    # except ConnectionRefusedError:
    #     return False
    # else:
    #     print('Connect client to ExcelServer')

    AppParser = TM1AppParser(
        app_dir=config['app_dir'], df_dir=config['df_dir'], db_pattern=config['db_ptrn'],
        dimensions=config['dim_file'], description=description
    )
    AppParser.fit()
    app_structure = AppParser.structure

    process_structure = []
    for proces_path in pathlib.Path(DF_DIR).glob('*.pro'):
        ProcParser = TM1ProcessParser(
            proces_path, tech_dict=tech_dict, datasources=data_sourses,
            functions=functions, structure=pro_dict_temp
        )

        ProcParser.parse()
        process_structure.append(ProcParser.structure)
    # pprint(app_structure)
    records = (app_structure, process_structure)
    create_doc(records, doc_path)

    # close Excel App connection
    # xlx_server_.send('close')

    return True


if __name__ == '__main__':
    # script_path = os.path.dirname(os.path.abspath(__file__))
    script_path = os.path.dirname(__file__)

    # формирование списка директоий, для поиска представлений и названия кубов
    search_paths = []
    with open(os.path.join(script_path, 'dir_list.txt'), 'r') as f:
        for line in f:
            search_paths.append(line.replace('\n', ''))

    doc_name = 'demo.docx'
    doc_path = os.path.join(script_path, 'output', doc_name)

    config_dict = {
        'df_dir': '/Users/franc/PycharmProjects/tm1find/test/DataFiles',
        'app_dir': '/Users/franc/PycharmProjects/tm1find/test/DataFiles/}Applications/06 Операционная деятельность',
        'desc_dim': '/Users/franc/PycharmProjects/tm1find/contents/description/tm1doc_}}Dimensions.csv',
        'desc_cube': '/Users/franc/PycharmProjects/tm1find/contents/description/tm1doc_}}Cubes.csv',
        'desc_pro': '/Users/franc/PycharmProjects/tm1find/contents/description/tm1doc_}}Processes.csv',
        'dim_file': '/Users/franc/PycharmProjects/tm1find/contents/description/tm1doc_CubeDim.csv',
        'db_ptrn': "(?<=DB\\(\\')[0-9а-яА-Я_\\sa-zA-Z]+"
    }

    run_techdes(search_paths, doc_path, config=config_dict)
    print('ok')
