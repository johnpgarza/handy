from django.core.validators import MaxValueValidator
from django.db import models
from phone_field import PhoneField
from .forms import SPECIALTY


class HandyMan(models.Model):
    date_joined = models.DateTimeField(auto_now_add=True)
    username = models.CharField(max_length=26, unique=True)
    first_name = models.CharField(max_length=26, help_text="First Name")
    last_name = models.CharField(max_length=26, help_text="Last Name")
    mi = models.CharField(max_length=1, help_text="One Character")
    street = models.CharField(max_length=26, help_text="Street Address")
    city = models.CharField(max_length=26, help_text="City")
    state = models.CharField(max_length=2, help_text="Two Character State CC")
    zip = models.PositiveIntegerField(validators=[MaxValueValidator(999999)], help_text="6 digit zip code ######")
    cell_phone = PhoneField(blank=True, help_text="Work Cell Phone")
    work_phone = PhoneField(blank=True, help_text="Work Land-line PHONE")
    specialty = models.CharField(choices=SPECIALTY, max_length=26, default="General")

    class Meta:
        verbose_name = 'My Work Force'
        verbose_name_plural = 'My Work Force'

    def __str__(self):
        return self.username
