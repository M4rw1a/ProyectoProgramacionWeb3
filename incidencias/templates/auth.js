/**
 * auth.js
 * Funciones de seguridad para el manejo de sesiones en Smart Aulas
 */

/**
 * Función mágica para cerrar sesión:
 * Borra el token de autenticación del almacenamiento local
 * y redirige al usuario de forma segura al Login.
 */
function cerrarSesion() {
    // 1. Borramos el token JWT (la llave de acceso) del navegador
    localStorage.removeItem('access_token');
    
    // 2. Opcional: Si también guardaste el refresh_token, bórralo igual
    localStorage.removeItem('refresh_token');

    // 3. Confirmación visual para el usuario
    console.log("Sesión cerrada correctamente.");

    // 4. Redirigimos al Login
    window.location.href = '/login/';
}

/**
 * Función auxiliar:
 * Verifica si el usuario tiene una sesión activa antes de cargar una página.
 * Útil para proteger las vistas de reporte.
* */
function verificarSesion() {
    const token = localStorage.getItem('access_token');
    if (!token) {
        alert("Tu sesión ha expirado o no has iniciado sesión. Serás redirigido al Login.");
        window.location.href = '/login/';
    }
}