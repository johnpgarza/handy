from django.urls import path, include
from django.contrib.auth import views as auth_views
from django.views.generic import TemplateView

from . import views

urlpatterns = [
    # path('login/', views.user_login, name='login'),
    path('', include('django.contrib.auth.urls')),
    path('login/', auth_views.LoginView.as_view(), name='login'),
    path('logout/', auth_views.LogoutView.as_view(), name='logout'),
    path('password_change/', auth_views.PasswordChangeView.as_view(), name='password_change'),
    path('password_change/done/', auth_views.PasswordChangeDoneView.as_view(), name='password_change_done'),
    path('register/', views.register, name='register'),
    path('email/', views.email_form, name='email'),
    path('success/', TemplateView.as_view(template_name='email_success.html'), name='success')
]
