from django.db import models
from .forms import LOCATION, TYPE, STATUS


class Ticket(models.Model):
    day = models.DateTimeField(auto_now_add=True)
    location = models.CharField(choices=LOCATION, max_length=26, default="Exterior")
    type = models.CharField(choices=TYPE, max_length=26, default="Other")
    problem = models.TextField(max_length=255)
    ticket_open = models.BooleanField(default=True)


class TicketStatus(models.Model):
    day = models.DateTimeField(auto_now_add=True)
    ticket = models.ForeignKey(
        Ticket, on_delete=models.CASCADE
    )
    status = models.CharField(choices=STATUS, max_length=26, default="Queue")
    reason = models.TextField(max_length=255, default="Ticket Created")
