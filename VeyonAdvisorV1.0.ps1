Function Mostrar-MensajeAdvertencia {
    $mensaje = "Conexión bloqueada"
    Start-Job -ArgumentList $mensaje -ScriptBlock {
    (New-Object -COM Wscript.Shell).Popup(($args[0] -join "`r`n"), 0, "Conexion Bloqueada", "48")} | Out-Null > $null }

Function Borrar-ReglasFirewall {
    Remove-NetFirewallRule -DisplayName Veyon 2>&1 > $null
    Remove-NetFirewallRule -DisplayName VNC 2>&1 > $null
    Remove-NetFirewallRule -DisplayName Personalizada 2>&1 > $null
    Remove-NetFirewallRule -DisplayName noVNC 2>&1 > $null}

Function Firewall {
    Param
    (
        $Puerto,
        $Servicio 
    ) 
        if ( $Servicio -eq "VNC" ) {
                New-NetFirewallRule -DisplayName noVNC -Enabled True -Protocol TCP -LocalPort 59001-59009,58001-58009 -Direction Inbound -Action Block > $null }
        Set-Variable -Name Conexion -Value (NETSTAT -AN | Select-String "$Puerto" | Select-String "ESTABLISHED" -Quiet)
        if ( $Conexion -eq $true ) {
            if ( $Opcion4 -eq "y" ) {
                Get-Date -Format "dddd MM/dd/yyyy HH:mm K" >> logvyadv.txt
                NETSTAT -AN | Select-String "$Puerto" | Select-String "ESTABLISHED" >> logvyadv.txt }
            NETSTAT -AN | Select-String "$Puerto" | Select-String "ESTABLISHED" 
            Enable-NetFirewallRule -DisplayName $Servicio
            Mostrar-MensajeAdvertencia
            $Opcion2 = Read-Host -Prompt '¿Quieres desbloquear la conexión? (Y)/n >'
            if ( $Opcion2 -ne "n" ) {
                Borrar-ReglasFirewall
                Read-Host -Prompt 'Presione Enter para salir'
                exit }
            echo "Recuerda borrar las reglas del Firewall"
            Remove-NetFirewallRule -DisplayName noVNC 2>&1 > $null
            Read-Host -Prompt 'Presione Enter para salir'
            break }}

[System.Console]::Title = "Veyon Advisor"
clear
Borrar-ReglasFirewall
Get-Content .\MadeBy.txt
echo "Elige que servicios quieres monitorizar"
echo "1. Veyon service"
echo "2. VNC puertos 5800 y 5900"
echo "3. Veyon & VNC"
echo "4. Especifica un puerto"
echo "5. Cerrar"
$Opcion1 = Read-Host -Prompt 'Opcion>'
if ( $Opcion1 -ne 5 ) {
    $Opcion4 = Read-Host -Prompt 'Introduce (y) para guardar logs>'}
switch ($Opcion1) {
"1" {
    echo "No cierres esta ventana para permanecer protegido"
    New-NetFirewallRule -DisplayName Veyon -Enabled False -Protocol TCP -LocalPort 11100 -Direction Inbound -Action Block > $null 
    for (;;) { 
        Firewall -Puerto "11100" -Servicio Veyon }}
"2" {
    echo "No cierres esta ventana para permanecer protegido"
    New-NetFirewallRule -DisplayName VNC -Enabled False -Protocol TCP -LocalPort 5800,5900 -Direction Inbound -Action Block > $null 
    for (;;) { 
        Firewall -Puerto "5900" -Servicio VNC
        Firewall -Puerto "5800" -Servicio VNC }}
"3" {
    echo "No cierres esta ventana para permanecer protegido"
    New-NetFirewallRule -DisplayName Veyon -Enabled False -Protocol TCP -LocalPort 11100 -Direction Inbound -Action Block > $null
    New-NetFirewallRule -DisplayName VNC -Enabled False -Protocol TCP -LocalPort 5800,5900 -Direction Inbound -Action Block > $null 
    for (;;) { 
        Firewall -Puerto "11100" -Servicio Veyon
        Firewall -Puerto "5900" -Servicio VNC
        Firewall -Puerto "5800" -Servicio VNC }}
"4" {
    $Opcion3 = Read-Host -Prompt 'Especifica un puerto sin comillas>'
    echo "No cierres esta ventana para permanecer protegido"
    New-NetFirewallRule -DisplayName Personalizada -Enabled False -Protocol TCP -LocalPort $Opcion3 -Direction Inbound -Action Block > $null 
    for (;;) { 
        Firewall -Puerto "$Opcion3" -Servicio Personalizada }}
"5" { break }}