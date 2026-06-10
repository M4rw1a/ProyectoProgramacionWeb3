from rest_framework import serializers
from .models import Perfil, Aula, Incidencia, Seguimiento
from django.contrib.auth.models import User


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'username', 'email']


class PerfilSerializer(serializers.ModelSerializer):
    usuario = UserSerializer()

    class Meta:
        model = Perfil
        fields = '__all__'


class AulaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Aula
        fields = '__all__'


class SeguimientoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Seguimiento
        fields = '__all__'


class IncidenciaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Incidencia
        fields = '__all__'