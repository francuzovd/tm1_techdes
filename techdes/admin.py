from django.contrib import admin
from .models import Logger, Config

# Register your models here.
admin.site.register(Logger)
admin.site.register(Config)
