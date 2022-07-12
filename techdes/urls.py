from django.urls import path, re_path
from tm1_techdes_web import settings

from . import views

app_name = 'techdes'
urlpatterns = [
    path('', views.index, name='index'),
    path('detail/', views.detail, name='detail'),
    path('detail/vote/', views.vote, name='vote'),
    path('configuration/', views.configuration, name='configuration'),
    path('configuration/save/', views.save_config, name='save_config'),
    path('detail/error/', views.error, name='error'),
    path('detail/result/', views.result, name='result'),
    path('application_logs/', views.application_logs, name='application_logs'),
]