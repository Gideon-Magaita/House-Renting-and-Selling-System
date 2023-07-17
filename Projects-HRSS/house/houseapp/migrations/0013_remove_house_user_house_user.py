# Generated by Django 4.0 on 2023-02-26 23:16

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('auth', '0012_alter_user_first_name_max_length'),
        ('houseapp', '0012_remove_house_user_house_user'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='house',
            name='user',
        ),
        migrations.AddField(
            model_name='house',
            name='user',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='auth.user'),
        ),
    ]