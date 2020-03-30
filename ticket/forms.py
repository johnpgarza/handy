from django import forms
from .models import Ticket, TicketStatus


class TicketForm(forms.ModelForm):
    class Meta:
        model = Ticket
        fields = ('location', 'type', 'problem',)


class NewStatusForm(forms.ModelForm):
    class Meta:
        model = TicketStatus
        fields = ('ticket', 'status', 'reason')


class AssignmentUpdateForm(forms.ModelForm):
    class Meta:
        model = Ticket
        fields = ['assigned_employee', 'location', 'type', 'problem']
    location = forms.CharField(widget=forms.TextInput(attrs={'readonly': 'readonly'}))
    type = forms.CharField(widget=forms.TextInput(attrs={'readonly': 'readonly'}))
    problem = forms.CharField(widget=forms.TextInput(attrs={'readonly': 'readonly'}))
