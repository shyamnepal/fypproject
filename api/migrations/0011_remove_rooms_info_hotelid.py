# Generated by Django 4.0.1 on 2022-02-18 20:24

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0010_alter_rooms_info_hotelid'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='rooms_info',
            name='hotelID',
        ),
    ]