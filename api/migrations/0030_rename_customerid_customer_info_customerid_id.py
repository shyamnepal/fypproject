# Generated by Django 4.0.1 on 2022-04-16 01:34

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0029_rename_customer_id_customer_info_customerid'),
    ]

    operations = [
        migrations.RenameField(
            model_name='customer_info',
            old_name='customerId',
            new_name='customerId_id',
        ),
    ]