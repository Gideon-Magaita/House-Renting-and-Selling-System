# Generated by Django 4.1.7 on 2023-03-18 20:01

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('houseapp', '0017_house_user'),
    ]

    operations = [
        migrations.CreateModel(
            name='Feedback',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('feedback', models.CharField(max_length=250)),
            ],
        ),
    ]
