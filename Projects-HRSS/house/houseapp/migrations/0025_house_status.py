# Generated by Django 4.1.7 on 2023-03-19 05:47

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('houseapp', '0024_alter_house_price'),
    ]

    operations = [
        migrations.AddField(
            model_name='house',
            name='status',
            field=models.CharField(blank=True, choices=[('full', 'full'), ('sold out', 'sold out'), ('pending', 'pending')], default='pending', max_length=200, null=True),
        ),
    ]
