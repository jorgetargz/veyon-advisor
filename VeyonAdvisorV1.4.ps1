Function Mostrar-MensajeAdvertencia {
    $test = (Get-Process -Name Win*).ProcessName 
    $mensaje = "Conexión bloqueada"
    Start-Job -ArgumentList $mensaje -ScriptBlock {
    (New-Object -COM Wscript.Shell).Popup(($args[0] -join "`r`n"), 0, "Conexion Bloqueada", "48")} | Out-Null > $null }
Function Firewall {
    Param
    (
        $Puerto,
        $Servicio 
    ) 
        Set-Variable -Name Conexion -Value (NETSTAT -AN | Select-String "$Puerto" | Select-String "ESTABLISHED" -Quiet)
        if ( $Conexion -eq $true ) {
            NETSTAT -AN | Select-String -SimpleMatch -NotMatch "5800*" | Select-String -SimpleMatch -NotMatch "5900*" | Select-String "$Puerto" | Select-String "ESTABLISHED" 
            Enable-NetFirewallRule -DisplayName $Servicio
            Mostrar-MensajeAdvertencia
            $Opcion2 = Read-Host -Prompt '¿Quieres desbloquear la conexión? (Y)/n >'
            if ( $Opcion2 -ne "n" ) {
                Remove-NetFirewallRule -DisplayName $Servicio 
                Read-Host -Prompt 'Presione Enter para salir'
                exit }
            Read-Host -Prompt 'Presione Enter para salir'
            break }}
echo "-------------------------------------------------------"
echo "VeyonAdvisorV1.4"
echo "-------------------------------------------------------"
echo "-------------------------------------------------------"
echo "Made by jorge.tar.gz"
echo "IndustriasChan"
echo "-------------------------------------------------------"        
echo "industriaschan@gmail.com"
echo "-------------------------------------------------------"
echo "Elige que servicios quieres monitorizar"
echo "1. Veyon service"
echo "2. VNC puertos 5800 y 5900"
echo "3. Veyon & VNC"
echo "4. Cerrar"
$Opcion1 = Read-Host -Prompt 'Opcion>'
switch ($Opcion1) {
"1" {
    echo "No cierres esta ventana para permanecer protegido"
    New-NetFirewallRule -DisplayName Veyon -Enabled False -Protocol TCP -LocalPort 11100 -Direction Inbound -Action Block > $null 
    for (;;) { 
        Firewall -Puerto "11100" -Servicio Veyon }}
"2" {
    echo "No cierres esta ventana para permanecer protegido"
    New-NetFirewallRule -DisplayName VNC -Enabled False -Protocol TCP -LocalPort 5800-5900 -Direction Inbound -Action Block > $null 
    for (;;) { 
        Firewall -Puerto "5900" -Servicio VNC
        Firewall -Puerto "5800" -Servicio VNC }}
"3" {
    echo "No cierres esta ventana para permanecer protegido"
    New-NetFirewallRule -DisplayName Veyon -Enabled False -Protocol TCP -LocalPort 11100 -Direction Inbound -Action Block > $null
    New-NetFirewallRule -DisplayName VNC -Enabled False -Protocol TCP -LocalPort 5800-5900 -Direction Inbound -Action Block > $null 
    for (;;) { 
        Firewall -Puerto "11100" -Servicio Veyon
        Firewall -Puerto "5900" -Servicio VNC
        Firewall -Puerto "5800" -Servicio VNC }}
"4" { break }}
