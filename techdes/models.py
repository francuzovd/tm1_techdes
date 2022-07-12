from django.db import models


class Logger(models.Model):
    date = models.DateTimeField()
    action = models.CharField(max_length=200)
    type = models.CharField(max_length=20)


class Config(models.Model):
    datafiles = models.CharField(max_length=200)
    applications = models.CharField(max_length=200)
    output = models.CharField(max_length=200)
    date_format = models.CharField(max_length=30)
    output_encoding = models.CharField(max_length=10)
    input_encoding = models.CharField(max_length=10)
    contents = models.CharField(max_length=200)
    dbpattern = models.CharField(max_length=50)
    empty_value = models.CharField(max_length=10)

    def get_values(self):
        return self.__dict__