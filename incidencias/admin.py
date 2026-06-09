from django.contrib import admin

from .models import (
    Perfil,
    Aula,
    Incidencia,
    Seguimiento
)

admin.site.register(Perfil)
admin.site.register(Aula)
admin.site.register(Incidencia)
admin.site.register(Seguimiento)