from django import forms


class LoginForm(forms.Form):
    username = forms.CharField()
    password = forms.CharField(widget=forms.PasswordInput)


SPECIALTY = (
    ("General", "General"),
    ("Electrician", "Electrician"),
    ("Plumber", "Plumber"),
    ("Carpenter", "Carpenter"),
    ("Mason", "Mason"),
    ("HVAC", "HVAC"),
)
