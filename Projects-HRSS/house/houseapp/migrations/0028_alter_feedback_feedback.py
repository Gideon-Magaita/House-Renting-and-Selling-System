# Generated by Django 4.1.7 on 2023-03-19 10:13

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('houseapp', '0027_alter_ownermessage_timestamp_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='feedback',
            name='feedback',
            field=models.TextField(),
        ),
    ]
