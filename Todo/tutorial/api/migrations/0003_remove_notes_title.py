# Generated by Django 4.1.3 on 2022-11-14 06:34

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0002_rename_modelname_notes'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='notes',
            name='title',
        ),
    ]
