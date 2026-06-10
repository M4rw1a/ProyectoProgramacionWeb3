from django.db import models
from django.contrib.auth.models import User


class Perfil(models.Model):

    ROLES = [
        ('ESTUDIANTE', 'Estudiante'),
        ('DOCENTE', 'Docente'),
        ('ADMINISTRADOR', 'Administrador'),
    ]

    usuario = models.OneToOneField(
        User,
        on_delete=models.CASCADE
    )

    registro_ud = models.CharField(
        max_length=20,
        unique=True
    )

    rol = models.CharField(
        max_length=20,
        choices=ROLES
    )

    def __str__(self):
        return f"{self.usuario.username} - {self.rol}"


class Aula(models.Model):

    TIPOS = [
        ('AULA', 'Aula'),
        ('LABORATORIO', 'Laboratorio'),
        ('AUDITORIO', 'Auditorio'),
    ]

    codigo = models.CharField(
        max_length=20,
        unique=True
    )

    tipo = models.CharField(
        max_length=20,
        choices=TIPOS
    )

    piso = models.CharField(
        max_length=30
    )

    def __str__(self):
        return self.codigo


class Incidencia(models.Model):

    TIPOS_PROBLEMA = [
        ('PROYECTOR', 'Proyector'),
        ('COMPUTADORA', 'Computadora'),
        ('ILUMINACION', 'Iluminacion'),
        ('MOBILIARIO', 'Mobiliario'),
        ('CONECTIVIDAD', 'Conectividad'),
        ('OTRO', 'Otro'),
    ]

    ESTADOS = [
        ('PENDIENTE', 'Pendiente'),
        ('EN_PROCESO', 'En Proceso'),
        ('RESUELTA', 'Resuelta'),
    ]

    usuario = models.ForeignKey(
        User,
        on_delete=models.CASCADE
    )

    aula = models.ForeignKey(
        Aula,
        on_delete=models.CASCADE
    )

    tipo_problema = models.CharField(
        max_length=20,
        choices=TIPOS_PROBLEMA
    )

    descripcion = models.TextField()

    estado = models.CharField(
        max_length=20,
        choices=ESTADOS,
        default='PENDIENTE'
    )

    fecha_reporte = models.DateTimeField(
        auto_now_add=True
    )

    def __str__(self):
        return f"Incidencia {self.id}"


class Seguimiento(models.Model):

    incidencia = models.ForeignKey(
        Incidencia,
        on_delete=models.CASCADE,
        related_name='seguimientos'
    )

    comentario = models.TextField()

    fecha = models.DateTimeField(
        auto_now_add=True
    )

    def __str__(self):
        return f"Seguimiento {self.id}"