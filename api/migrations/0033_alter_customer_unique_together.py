# Generated by Django 4.0.1 on 2022-04-16 01:51

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0032_alter_customer_unique_together_customer_customerid_and_more'),
    ]

    operations = [
        migrations.AlterUniqueTogether(
            name='customer',
            unique_together=set(),
        ),
    ]
