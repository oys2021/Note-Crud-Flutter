# Generated by Django 4.1.3 on 2022-12-01 23:35

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0003_remove_notes_title'),
    ]

    operations = [
        migrations.AddField(
            model_name='notes',
            name='title',
            field=models.CharField(max_length=144, null=True),
        ),
    ]