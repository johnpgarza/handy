from django.contrib import admin
from .models import HandyMan


class HandyManAdmin(admin.ModelAdmin):
    model = HandyMan
    list_display = ("last_name", "first_name", "mi", "specialty")
    list_filter = ("last_name", "specialty")


admin.site.register(HandyMan, HandyManAdmin)
