from django.shortcuts import render
from rest_framework import viewsets
from rest_framework.permissions import IsAuthenticatedOrReadOnly

from rest_framework.decorators import api_view
from rest_framework.response import Response

from .models import Incidencia, Aula, Seguimiento, Perfil
from .serializers import (
    IncidenciaSerializer,
    AulaSerializer,
    SeguimientoSerializer,
    PerfilSerializer
)

class AulaViewSet(viewsets.ModelViewSet):
    queryset = Aula.objects.all()
    serializer_class = AulaSerializer

class PerfilViewSet(viewsets.ModelViewSet):
    queryset = Perfil.objects.all()
    serializer_class = PerfilSerializer

class IncidenciaViewSet(viewsets.ModelViewSet):
    queryset = Incidencia.objects.all()
    serializer_class = IncidenciaSerializer
    permission_classes = [IsAuthenticatedOrReadOnly]

class SeguimientoViewSet(viewsets.ModelViewSet):
    queryset = Seguimiento.objects.all()
    serializer_class = SeguimientoSerializer
    permission_classes = [IsAuthenticatedOrReadOnly]

    def perform_create(self, serializer):
        seguimiento = serializer.save()
        incidencia = seguimiento.incidencia
        incidencia.estado = seguimiento.estado
        incidencia.save()

@api_view(['GET'])
def incidencias_pendientes(request):
    incidencias = Incidencia.objects.filter(estado='PENDIENTE')
    serializer = IncidenciaSerializer(incidencias, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def incidencias_resueltas(request):
    incidencias = Incidencia.objects.filter(estado='RESUELTA')
    serializer = IncidenciaSerializer(incidencias, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def incidencias_tipo(request, tipo):
    incidencias = Incidencia.objects.filter(tipo_problema__iexact=tipo)
    serializer = IncidenciaSerializer(incidencias, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def incidencias_aula(request, id):
    incidencias = Incidencia.objects.filter(aula_id=id)
    serializer = IncidenciaSerializer(incidencias, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def estadisticas(request):
    pendientes = Incidencia.objects.filter(estado='PENDIENTE').count()
    proceso = Incidencia.objects.filter(estado='EN_PROCESO').count()
    resueltas = Incidencia.objects.filter(estado='RESUELTA').count()
    total = Incidencia.objects.count()

    return Response({
        "pendientes": pendientes,
        "en_proceso": proceso,
        "resueltas": resueltas,
        "total": total
    })

# ==========================================
# Vistas corregidas (Sin prefijo 'incidencias/')
# ==========================================

def home(request):
    return render(request, 'index.html')

def vista_dashboard(request):
    return render(request, 'dashboard.html')

def vista_incidencias(request):
    return render(request, 'incidencias.html')

def vista_registrar(request):
    return render(request, 'registrar.html')

def vista_seguimientos(request):
    return render(request, 'seguimientos.html')

def vista_login(request):
    return render(request, 'login.html')