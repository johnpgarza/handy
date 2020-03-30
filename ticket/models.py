from django.db import models
from django.urls import reverse

from .utils import LOCATION, TYPE, STATUS
from handyman.models import HandyMan


class Ticket(models.Model):
    day = models.DateTimeField(auto_now_add=True)
    ticket_number = models.AutoField(primary_key=True)
    location = models.CharField(choices=LOCATION, max_length=26, default="Exterior")
    type = models.CharField(choices=TYPE, max_length=26, default="Other")
    problem = models.TextField(max_length=255)
    assigned_employee = models.ForeignKey(
        HandyMan, to_field='username', blank=True, null=True, on_delete=models.CASCADE
    )
    ticket_open = models.BooleanField(default=True)

    class Meta:
        verbose_name = 'My Ticket'
        verbose_name_plural = 'My Tickets'

    def __str__(self):
        return str(self.pk)


class TicketStatus(models.Model):
    day = models.DateTimeField(auto_now_add=True)
    ticket = models.ForeignKey(
        Ticket, to_field='ticket_number', on_delete=models.CASCADE
    )
    status = models.CharField(choices=STATUS, max_length=26, default="Queue")
    reason = models.TextField(max_length=255, default="Ticket Created")

    class Meta:
        verbose_name = 'My Ticket Status'
        verbose_name_plural = 'My Tickets Status'

    def __str__(self):
        return str(self.pk)
