# Generated by Django 3.0.4 on 2020-03-23 20:00

import django.core.validators
from django.db import migrations, models
import phone_field.models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='HandyMan',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date_joined', models.DateTimeField(auto_now_add=True)),
                ('first_name', models.CharField(help_text='First Name', max_length=26)),
                ('last_name', models.CharField(help_text='Last Name', max_length=26)),
                ('mi', models.CharField(help_text='One Character', max_length=1)),
                ('street', models.CharField(help_text='Street Address', max_length=26)),
                ('city', models.CharField(help_text='City', max_length=26)),
                ('state', models.CharField(help_text='Two Character State CC', max_length=2)),
                ('zip', models.PositiveIntegerField(help_text='6 digit zip code ######', validators=[django.core.validators.MaxValueValidator(999999)])),
                ('cell_phone', phone_field.models.PhoneField(blank=True, help_text='Work Cell Phone', max_length=31)),
                ('work_phone', phone_field.models.PhoneField(blank=True, help_text='Work Land-line PHONE', max_length=31)),
                ('specialty', models.CharField(choices=[('General', 'General'), ('Electrician', 'Electrician'), ('Plumber', 'Plumber'), ('Carpenter', 'Carpenter'), ('Mason', 'Mason'), ('HVAC', 'HVAC')], default='General', max_length=26)),
            ],
        ),
    ]
