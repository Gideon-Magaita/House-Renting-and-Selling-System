# Generated by Django 4.0 on 2023-02-26 23:14

from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('houseapp', '0011_alter_house_user'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='house',
            name='user',
        ),
        migrations.AddField(
            model_name='house',
            name='user',
            field=models.ManyToManyField(blank=True, null=True, to=settings.AUTH_USER_MODEL),
        ),
    ]