import os
from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse
# from django.template import loader

from .models import Logger, Config

from main import run_techdes
from glob_var import OUTPUT_FILE

from datetime import datetime
import sys


def logging(fn, *args, **kwargs):

    def create_log(*args, **kwargs):
        log_date = datetime.today()
        fn_name = fn.__name__

        try:
            response = fn(*args)
        except:
            exc_type, exc_obj, exc_tb = sys.exc_info()
            action_ = f'{exc_type}, {exc_obj}'
            type_ = 'ERROR'
            response = error(args[0], error_message=action_)
        else:

            if fn_name == 'result':
                action_ = f'Open {fn_name} page with message: {{{args[1]}}}/'
            elif fn_name == 'vote':
                PostDict = args[0].POST
                action_ = f'Run "Create document" with parameters: "{PostDict["dir_path"]}", "{PostDict["doc_name"]}"'
            elif fn_name == 'save_config':
                action_ = f'Configuration table updated'
            else:
                action_ = f'Open {fn_name} page'
            type_ = 'INFO'

        log = Logger(
            date=log_date,
            action=action_,
            type=type_
        )
        log.save()

        return response

    return create_log


@logging
def index(request):
    # latest_log_list = Logger.objects.order_by('-date')[:5]
    # context = {
    #     'latest_log_list': latest_log_list
    # }

    return HttpResponse(render(request, 'techdes/index.html' ))


@logging
def detail(request):
    config = get_object_or_404(Config, pk=1)
    context = {
        'config': config
    }

    return HttpResponse(render(request, 'techdes/detail.html', context))


@logging
def vote(request):
    PostDict = request.POST

    try:
        dir_path = PostDict.get('dir_path', False)
        doc_name = PostDict.get('doc_name', False)
    except(KeyError):
        error_message = 'Fill all fields on the form'
        return error(request, error_message)
    else:
        if len(dir_path) * len(doc_name) == 0:
            message = 'Fill all fields on the form'
        elif os.path.exists(dir_path):
            config = get_object_or_404(Config, pk=1)

            config.applications = dir_path
            config.save()

            config_dict = {
                'df_dir': config.datafiles,
                'app_dir': dir_path,
                'desc_dim': os.path.join(config.contents, 'description', 'tm1doc_}Dimensions.csv'),
                'desc_cube': os.path.join(config.contents, 'description', 'tm1doc_}Cubes.csv'),
                'desc_pro': os.path.join(config.contents, 'description', 'tm1doc_}Processes.csv'),
                'dim_file': os.path.join(config.contents, 'description', 'tm1doc_CubeDimensions.csv'),
                'db_ptrn': config.dbpattern
            }
            if not os.path.exists(config.output):
                os.mkdir(config.output)
            doc_path = os.path.join(config.output, f'{doc_name}.docx')

            # run program
            func_result = run_techdes([dir_path], doc_path, config=config_dict)
            if func_result:
                message = f'Document created - {doc_path}'
            else:
                message = f'Error! Check connection to Excel Server'
        else:
            message = '"Path to Application folder" contain mistakes.\nPlease check this field and write absolute path to Aplication folder.'

        return result(request, message)


@logging
def result(request, message):
    context = {
        'message': message
    }
    return HttpResponse(render(request, 'techdes/result.html', context))


@logging
def configuration(request):
    config = get_object_or_404(Config, pk=1)
    context = {
        'config': config
    }

    return HttpResponse(render(request, 'techdes/configuration.html', context))


@logging
def save_config(request):
    config = get_object_or_404(Config, pk=1)

    PostDict = request.POST
    print(PostDict)
    counter = 0
    for key, value in PostDict.items():
        if len(value) > 0:
            config.get_values()[key] = value
            counter += 1
    if counter > 0:
        config.save()

    context = {
        'config': config
    }
    return HttpResponse(render(request, 'techdes/configuration.html', context))


@logging
def error(request, error_message):
    context = {
        'error_message': error_message
    }
    return HttpResponse(render(request, 'techdes/error.html', context))


@logging
def application_logs(request):
    logs = Logger.objects.all()[::-1]
    return HttpResponse(render(request, 'techdes/application_logs.html', {'logs': logs}))
