# Generated by Django 4.0 on 2023-02-10 02:45

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('houseapp', '0003_housetype_alter_house_number_alter_house_owner'),
    ]

    operations = [
        migrations.AddField(
            model_name='house',
            name='category',
            field=models.ForeignKey(default=None, on_delete=django.db.models.deletion.CASCADE, to='houseapp.housetype'),
        ),
    ]