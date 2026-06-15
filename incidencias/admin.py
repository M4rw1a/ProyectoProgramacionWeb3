from django import forms
from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm
from .models import Incidencia, Aula, Seguimiento, Perfil

# --- 1. ACCIONES PARA EL MENÚ SUPERIOR ---
# Estas funciones aparecerán en el menú desplegable junto al botón "Ir"
@admin.action(description="Asignar rol: ESTUDIANTE")
def asignar_estudiante(modeladmin, request, queryset):
    for user in queryset:
        user.perfil.rol = 'ESTUDIANTE' # Asegúrate de que coincida con tus opciones exactas de models.py
        user.perfil.save()

@admin.action(description="Asignar rol: DOCENTE")
def asignar_docente(modeladmin, request, queryset):
    for user in queryset:
        user.perfil.rol = 'DOCENTE'
        user.perfil.save()

@admin.action(description="Asignar rol: ADMINISTRADOR")
def asignar_administrador(modeladmin, request, queryset):
    for user in queryset:
        user.perfil.rol = 'ADMINISTRADOR'
        user.perfil.save()


# --- 2. FORMULARIO PERSONALIZADO DE CREACIÓN ---
class FormularioCreacionUsuario(UserCreationForm):
    # Asegúrate de que Perfil.ROLES exista en tu models.py
    rol = forms.ChoiceField(choices=Perfil.ROLES, required=True, initial='ESTUDIANTE')

    class Meta:
        model = User
        fields = ("username", "rol")

    def save(self, commit=True):
        user = super().save(commit=commit)
        if commit:
            user.perfil.rol = self.cleaned_data['rol']
            user.perfil.save()
        return user


# --- 3. CONFIGURACIÓN DE USUARIOS ---
admin.site.unregister(User)

@admin.register(User)
class UserAdmin(BaseUserAdmin):
    add_form = FormularioCreacionUsuario
    
    # Agregamos las acciones al menú superior
    actions = [asignar_estudiante, asignar_docente, asignar_administrador]

    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': ('username', 'password1', 'password2', 'rol'),
        }),
    )

    list_display = ('username', 'email', 'first_name', 'last_name', 'is_staff', 'get_rol')
    fieldsets = BaseUserAdmin.fieldsets

    def get_rol(self, obj):
        try:
            return obj.perfil.rol
        except:
            return "Sin rol"
    get_rol.short_description = 'Rol'


# --- 4. CONFIGURACIÓN DE PERFILES ---
@admin.register(Perfil)
class PerfilAdmin(admin.ModelAdmin):
    list_display = ('usuario', 'rol', 'registro_ud')
    list_editable = ('rol',) 
    list_filter = ('rol',)
    search_fields = ('usuario__username', 'registro_ud')
    ordering = ('usuario__username',) 


# --- 5. CONFIGURACIÓN DE INCIDENCIAS Y OTROS ---
@admin.register(Incidencia)
class IncidenciaAdmin(admin.ModelAdmin):
    list_display = ('id', 'aula', 'tipo_problema', 'estado', 'fecha_reporte')
    list_filter = ('estado', 'tipo_problema')
    list_editable = ('estado',)

admin.site.register(Aula)
admin.site.register(Seguimiento)