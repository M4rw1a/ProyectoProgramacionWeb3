# Smart Aulas - Sistema de Gestión

## Pasos para ejecutar el proyecto en tu máquina:

1. **Clonar el repositorio:**
   ```bash
   git clone <URL_DEL_REPOSITORIO>
   cd <NOMBRE_DE_LA_CARPETA>
Crear y activar el entorno virtual:

Bash
python -m venv env
# En Windows:
.\env\Scripts\activate
# En Mac/Linux:
source env/bin/activate
Instalar las dependencias:

Bash
pip install -r librerias.txt
Configurar la Base de Datos:
Asegúrate de tener MySQL corriendo localmente y crea una base de datos con el nombre correspondiente al proyecto.

Aplicar las migraciones:

Bash
python manage.py migrate
Crear el superusuario y correr el servidor:

Bash
python manage.py createsuperuser
python manage.py runserver