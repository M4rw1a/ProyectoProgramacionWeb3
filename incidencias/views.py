from django.shortcuts import render
from rest_framework import viewsets
from .models import Incidencia, Aula, Seguimiento, Perfil
from .serializers import (
    IncidenciaSerializer,
    AulaSerializer,
    SeguimientoSerializer,
    PerfilSerializer
)


class IncidenciaViewSet(viewsets.ModelViewSet):
    queryset = Incidencia.objects.all()
    serializer_class = IncidenciaSerializer


class AulaViewSet(viewsets.ModelViewSet):
    queryset = Aula.objects.all()
    serializer_class = AulaSerializer


class SeguimientoViewSet(viewsets.ModelViewSet):
    queryset = Seguimiento.objects.all()
    serializer_class = SeguimientoSerializer


class PerfilViewSet(viewsets.ModelViewSet):
    queryset = Perfil.objects.all()
    serializer_class = PerfilSerializer