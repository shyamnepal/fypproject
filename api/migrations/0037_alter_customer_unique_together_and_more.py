# Generated by Django 4.0.1 on 2022-04-16 22:55

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0036_alter_customer_unique_together_and_more'),
    ]

    operations = [
        migrations.AlterUniqueTogether(
            name='customer',
            unique_together=set(),
        ),
        migrations.AddField(
            model_name='customer',
            name='reservationNumber',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='+', to='api.reservation'),
        ),
        migrations.AlterUniqueTogether(
            name='customer',
            unique_together={('customerId', 'reservationNumber')},
        ),
    ]
