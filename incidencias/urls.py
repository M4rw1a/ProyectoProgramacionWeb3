from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import (
    IncidenciaViewSet,
    AulaViewSet,
    SeguimientoViewSet,
    PerfilViewSet
)


router = DefaultRouter()
router.register(r'incidencias', IncidenciaViewSet)
router.register(r'aulas', AulaViewSet)
router.register(r'seguimientos', SeguimientoViewSet)
router.register(r'perfiles', PerfilViewSet)

urlpatterns = [
    path('', include(router.urls)),
]