# veyon-advisor
Pequeño script para detectar conexiones de monitorización Veyon y VNC. Play Free

Es necesario ejecutar (Set-ExecutionPolicy -ExecutionPolicy Bypass) en powershell si la ejecucion del script devuelve error ocurrira si es la primera vez que se ejecuta un script en las version de Windows 10 Home 

-Changelog:
-

-V1.2 
-
-La conexion se restable al pulsar aceptar

-V1.3
-
-Añadido soporte para trafico VNC
-Se muestra en pantalla que ip realizo la conexión

-Comentarios
-
Si cierras el script una vez iniciado alguno de los 3 modos ejecuta el eliminador de reglas del firewall o elimina las reglas manualmente.
Si se detecta una conexion la regla se borra al pulsar aceptar
Las conexiones VNC mal finalizadas se siguen detectando como conexiones establecidas durante un corto periodo de tiempo
