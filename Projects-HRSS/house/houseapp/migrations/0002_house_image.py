# Generated by Django 4.0 on 2023-02-07 22:44

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('houseapp', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='house',
            name='image',
            field=models.ImageField(blank=True, null=True, upload_to=''),
        ),
    ]
