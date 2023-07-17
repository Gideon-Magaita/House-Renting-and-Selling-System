# Generated by Django 4.0 on 2023-02-07 21:43

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='House',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('owner', models.CharField(max_length=200, null=True)),
                ('number', models.CharField(max_length=200, null=True)),
                ('location', models.CharField(max_length=200, null=True)),
                ('price', models.FloatField(null=True)),
                ('rooms', models.CharField(max_length=200, null=True)),
            ],
        ),
    ]
