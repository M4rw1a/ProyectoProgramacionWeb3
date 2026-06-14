from django.contrib import admin
from .models import Incidencia, Aula, Seguimiento, Perfil

# Registramos el modelo de Incidencia con opciones avanzadas
@admin.register(Incidencia)
class IncidenciaAdmin(admin.ModelAdmin):
    # Columnas que se verán en la tabla principal
    list_display = ('id', 'aula', 'tipo_problema', 'estado', 'fecha_reporte')
    # Filtros laterales rápidos
    list_filter = ('estado', 'tipo_problema')
    # Barra de búsqueda (buscará palabras en la descripción)
    search_fields = ('descripcion',)
    # ¡Magia! Permite cambiar el estado directamente desde la tabla sin entrar al registro
    list_editable = ('estado',)

# Registramos el resto de modelos de forma sencilla
admin.site.register(Aula)
admin.site.register(Seguimiento)
admin.site.register(Perfil)