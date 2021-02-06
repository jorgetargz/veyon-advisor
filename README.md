# veyon-advisor
Pequeño script para detectar conexiones de monitorización Veyon y VNC. Play Free

Requiere privilegios de Administrador

Es necesario ejecutar (Set-ExecutionPolicy -ExecutionPolicy Bypass) en powershell si la ejecucion del script devuelve error, ocurrira si es la primera vez que se ejecuta un script en las version de Windows 10 Home 

-Changelog:
-

-V0.2-alpha
-

-La conexion se restable al pulsar aceptar

-V0.3-alpha
-

-Añadido soporte para trafico VNC
-Se muestra en pantalla que ip realizo la conexión

-V0.4-alpha
-

-El mensaje de advertencia no pausa la ejecucion del script
-Codigo simplificado mediante funciones
-Posibilidad de dejar la conexion bloqueada, se ha de ejecutar el limpiador para desbloquearla

-V0.5-alpha
-
-Añadida la opcion para monitorizar un puerto personalizado. 
-Añadida la opcion para guaradar logs.

-Comentarios
-

Si cierras el script una vez iniciado alguno de los 3 modos ejecuta el eliminador de reglas del firewall o elimina las reglas manualmente.
Las conexiones VNC mal finalizadas se siguen detectando como conexiones establecidas durante un corto periodo de tiempo Se detectan falsos positivos con los puertos 5800* y 5900*
