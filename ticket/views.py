from django.contrib.auth.mixins import LoginRequiredMixin
from django.http import HttpResponse
from django.shortcuts import render, redirect
from django.urls import reverse_lazy
from django.utils import timezone

from ticket.forms import TicketForm, NewStatusForm, AssignmentUpdateForm
from ticket.models import Ticket, TicketStatus
from django.views.generic import ListView, DetailView, UpdateView


def ticket_new(request):
    if request.method == "POST":
        form = TicketForm(request.POST)
        if form.is_valid():
            ticket = form.save(commit=False)
            ticket.save()
            return redirect('ticket_list')
    else:
        form = TicketForm()
    return render(request, '../templates/ticket_new.html', {'form': form})


def ticket_list(request):
    tickets = Ticket.objects.all().order_by('-day')
    ticket_fields = {'tickets': tickets}
    return render(request, '../templates/ticket_list.html', ticket_fields)


def ticket_detail(request, pk):
    tickets = Ticket.objects.filter(ticket_number=pk)
    ticket_fields = {'tickets': tickets}
    return render(request, '../templates/ticket_detail.html', ticket_fields)


def ticket_status(request, pk):
    tickets = TicketStatus.objects.filter(ticket=pk).order_by('-day')
    if tickets:
        ticket_fields = {'tickets': tickets}
        return render(request, '../templates/ticket_status.html', ticket_fields)
    else:
        form = NewStatusForm(request.POST, initial={'ticket': pk, 'status': 'Assigned', 'reason': 'Because'})
        if request.method == "POST":
            if form.is_valid():
                ticket = form.save(commit=False)
                ticket.save()
                return redirect('open_tickets')
            else:
                print('this is dumb')
                print(form.errors)
            return render(request, '../templates/status_new.html', {'form': form})
    return render(request, '../templates/status_new.html', {'form': form})


def open_tickets(request):
    tickets = Ticket.objects.filter(ticket_open=True).order_by('day')
    ticket_fields = {'tickets': tickets}
    return render(request, '../templates/open_ticket_list.html', ticket_fields)


def open_ticket_detail(request, pk):
    tickets = Ticket.objects.filter(ticket_number=pk)
    ticket_fields = {'tickets': tickets}
    return render(request, '../templates/open_ticket_detail.html', ticket_fields)


def status_new(request):
    if request.method == "POST":
        form = NewStatusForm(request.POST)
        if form.is_valid():
            ticket = form.save(commit=False)
            ticket.save()
            return redirect('open_tickets')
    else:
        form = NewStatusForm()
    return render(request, '../templates/status_new.html', {'form': form})


class TicketAssignmentUpdateView(UpdateView):
    model = Ticket
    form_class = AssignmentUpdateForm
    template_name = '../templates/ticket_assignment_update.html'
    success_url = reverse_lazy('open_tickets')
