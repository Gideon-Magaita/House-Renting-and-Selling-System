# Generated by Django 4.0 on 2023-02-26 12:17

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('houseapp', '0005_chatroom_alter_house_category'),
    ]

    operations = [
        migrations.AlterField(
            model_name='chatroom',
            name='chattitle',
            field=models.TextField(blank=True, max_length=200, null=True),
        ),
    ]