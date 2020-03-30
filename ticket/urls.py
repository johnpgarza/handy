from django.urls import path
from . import views

urlpatterns = [
    path('new/', views.ticket_new, name='ticket_new'),
    path('list/', views.ticket_list, name='ticket_list'),
    path('detail/<int:pk>', views.ticket_detail, name='ticket_detail'),
    path('status/<int:pk>', views.ticket_status, name='ticket_status'),
    path('status/new', views.status_new, name='status_new'),
    path('is_open/', views.open_tickets, name='open_tickets'),
    path('is_open_detail/<int:pk>', views.open_ticket_detail, name='open_ticket_detail'),
    path('assignment_update/<int:pk>', views.TicketAssignmentUpdateView.as_view(), name='assignment_update'),
]
