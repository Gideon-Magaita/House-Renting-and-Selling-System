# Generated by Django 4.1.7 on 2023-03-18 20:37

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('houseapp', '0018_feedback'),
    ]

    operations = [
        migrations.AlterField(
            model_name='house',
            name='number',
            field=models.CharField(max_length=200, null=True),
        ),
    ]
