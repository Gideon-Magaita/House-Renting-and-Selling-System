# Generated by Django 4.1.7 on 2023-03-18 19:52

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('houseapp', '0015_message'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='house',
            name='user',
        ),
    ]
