from django.contrib import admin
from django.http import HttpResponse
import csv
import datetime
from .models import Ticket, TicketStatus


def export_to_csv(modeladmin, request, queryset):
    opts = modeladmin.model._meta
    response = HttpResponse(content_type='text/csv')
    response['Content-Disposition'] = 'attachment;' \
                                      'filename={}.csv'.format(opts.verbose_name)
    writer = csv.writer(response)

    fields = [field for field in opts.get_fields() if not field.many_to_many
              and not field.one_to_many]
    # Write a first row with header information
    writer.writerow([field.verbose_name for field in fields])
    # Write data rows
    for obj in queryset:
        data_row = []
        for field in fields:
            value = getattr(obj, field.name)
            if isinstance(value, datetime.datetime):
                value = value.strftime('%d/%m/%Y')
            data_row.append(value)
        writer.writerow(data_row)
    return response


export_to_csv.short_description = 'Export to CSV'


class TicketAdmin(admin.ModelAdmin):
    model = Ticket
    list_display = ['day', 'location', 'type', 'ticket_open']
    list_filter = ['ticket_open', 'location']
    actions = [export_to_csv]


class TicketStatusAdmin(admin.ModelAdmin):
    model = TicketStatus
    list_display = ['day', 'status']
    list_filter = ['status']
    actions = [export_to_csv]


admin.site.register(Ticket, TicketAdmin)
admin.site.register(TicketStatus, TicketStatusAdmin)
