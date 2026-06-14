from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import (
    IncidenciaViewSet,
    AulaViewSet,
    SeguimientoViewSet,
    PerfilViewSet,
    incidencias_pendientes,
    incidencias_resueltas,
    incidencias_tipo,
    incidencias_aula,
    estadisticas,
    home,
    vista_incidencias,
    vista_registrar,
    vista_seguimientos,
    vista_login
)

router = DefaultRouter()
router.register(r'incidencias', IncidenciaViewSet)
router.register(r'aulas', AulaViewSet)
router.register(r'seguimientos', SeguimientoViewSet)
router.register(r'perfiles', PerfilViewSet)

urlpatterns = [
    # Rutas del CRUD original
    path('api/', include(router.urls)),
    
    # TUS RUTAS (Consultas personalizadas Fase 4)
    path('api/consultas/pendientes/', incidencias_pendientes, name='api_pendientes'),
    path('api/consultas/resueltas/', incidencias_resueltas, name='api_resueltas'),
    path('api/consultas/tipo/<str:tipo>/', incidencias_tipo, name='api_por_tipo'),
    path('api/consultas/aula/<int:id>/', incidencias_aula, name='api_por_aula'),
    path('api/consultas/estadisticas/', estadisticas, name='api_estadisticas'),
    
    # TUS RUTAS (Vistas Frontend)
    path('', home, name='home'),
    path('incidencias/', vista_incidencias, name='vista_incidencias'),
    path('registrar/', vista_registrar, name='vista_registrar'),
    path('seguimientos/', vista_seguimientos, name='vista_seguimientos'),
    
    path('login/', vista_login, name='vista_login'),
    
]