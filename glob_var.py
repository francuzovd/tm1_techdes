# директории
CUBES_LIST = 'cubes_list.txt'
APP_DIR = '/Users/franc/PycharmProjects/tm1find/test/DataFiles/}Applications/06 Операционная деятельность/00 Порейсовые доходы и расходы/06 Модель порейсовых доходов и расходов'
DF_DIR = '/Users/franc/PycharmProjects/tm1find/test/DataFiles'
PRO_DIR = '/Users/franc/PycharmProjects/tm1find/test/'
DESC_DIR = './contents/description'
DESC_DIM = f'{DESC_DIR}/tm1doc_}}Dimensions.csv'
DESC_CUBE = f'{DESC_DIR}/tm1doc_}}Cubes.csv'
DESC_PRO = f'{DESC_DIR}/tm1doc_}}Processes.csv'
DIM_FILE = f'{DESC_DIR}/tm1doc_CubeDim.csv'
EMPTY_VALUE = '-'
OUTPUT_FILE = '/Users/franc/PycharmProjects/tm1find/output/'

# patterns
DB_PTRN = r'(?<=DB\(\')[0-9а-яА-Я_\sa-zA-Z]+'

# форматы
DT_FORMAT = "%Y%m%d%H%M%S"

# кодровки
DESC_ENCODE = 'cp-1251'
CSV_ENCODE = 'utf-8'

# структуры

tech_dict = {
    '562': 'type_source',
    '586': 'source',
    # '602': 'pro_name',
    'code': ['572', '573', '574', '575', '590']
}

data_sourses = {
    'VIEW': 'datasourcenameforserver',
    'SUBSET': 'datasourcenameforserver',
    'ODBC': 'datasourcenameforserver',
    'CHARACTERDELIMITED': 'datasourcenameforserver'
}

functions = {
    'cellput': 'cubes',
    'cellincrement': 'cubes',
    'attrput': 'cubes',
    'dimensionelementinsert': 'dimensions',
    # 'dimensionelementcomponentadd': 'dimensions',
    # 'dimensionelementinsertdirect': 'dimensions',
    'dimensionelement': 'dimensions'
}

pro_dict_temp = {
    'run_cube': '',
    'source': '',
    'destination': {
        'cubes': [],
        'dimensions': []
    },
    'pro_name': '',
    'type_source': '',
    'daughter_proc': [],
    'description': '',
    'form_source': ''
}

app_structure = {
    'folder_name': '',
    'subfolder': [],
    'view': []
}

doc_TableHeader = {
    'view': ['Тип объекта системы', 'Объекты системы', 'Назначение/описание'],
    'process': ['Тип объекта системы', 'Объекты системы']
}

doc_FirstCol = {
    'view': {
        'app_name': 'Наименование Формы',
        'cube_name': 'Наименование куба',
        'dim_names': 'Наименования Измерений',
        'rux': 'Правила',
        'proc_name': 'Процессы'
    },
    'process': {
        'pro_name': 'Название Процесса',
        'form_source': 'Запускается из:',
        'description': 'Назначение:',
        'destination': 'Приёмник:',
        'daughter_proc': 'Запускает процесс:'
    }
}

doc_SecCol = {
    'view': {
        'src_name': 'Источники',
        'dst_name': 'Приёмники'
    },
    'process': {
        'cubes': 'Куб',
        'dimensions': 'Измерение',
    }
}

doc_ThrdCol = {
    'view': {
        'app_name': 'Пользовательский вид отображения',
        'cube_name': '',
        'dim_names': '',
        'proc_name': ''
        }
    }

doc_Titles = {
        'app_name': 'Форма',
        'pro_name': 'Процесс'
    }

MonthNames = [
        'января', 'февраля', 'марта', 'апреля', 'мая', 'июня'
        , 'июля', 'августа', 'сентября', 'октября', 'ноября', 'декабря'
    ]
doc_MonthNames = dict(zip(range(1, 13), MonthNames))