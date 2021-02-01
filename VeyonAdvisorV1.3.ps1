echo "-------------------------------------------------------"
echo "-------------------------------------------------------"
echo "VeyonAdvisorV1.3"
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
    New-NetFirewallRule -DisplayName VyAdvisor -Enabled False -Protocol TCP -LocalPort 11100 -Direction Inbound -Action Block > $null 
    for (;;) { 
        Set-Variable -Name Veyon -Value (NETSTAT -AN | Select-String "11100" | Select-String "ESTABLISHED" -Quiet)
        if ( $Veyon -eq $true ) {
            NETSTAT -AN | Select-String "11100" | Select-String "ESTABLISHED"
            Enable-NetFirewallRule -DisplayName VyAdvisor
            powershell -WindowStyle hidden -Command "& {[System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms'); [System.Windows.Forms.MessageBox]::Show('Conexión Veyon detectada y bloqueda pulsa aceptar para desbloquearla','Veyon detectado')}"
            Remove-NetFirewallRule -DisplayName VyAdvisor
            break }}}
"2" {
    echo "No cierres esta ventana para permanecer protegido"
    New-NetFirewallRule -DisplayName VNC1 -Enabled False -Protocol TCP -LocalPort "5800" -Direction Inbound -Action Block > $null 
    New-NetFirewallRule -DisplayName VNC2 -Enabled False -Protocol TCP -LocalPort "5900" -Direction Inbound -Action Block > $null
    for (;;) { 
        Set-Variable -Name VNC1 -Value (NETSTAT -AN | Select-String "5800" | Select-String "ESTABLISHED" -Quiet)
        if ( $VNC1 -eq $true ) {
            NETSTAT -AN | Select-String "5800" | Select-String "ESTABLISHED"
            Enable-NetFirewallRule -DisplayName VNC1
            Enable-NetFirewallRule -DisplayName VNC2
            powershell -WindowStyle hidden -Command "& {[System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms'); [System.Windows.Forms.MessageBox]::Show('Conexión VNC detectada y bloqueda pulsa aceptar para desbloquearla','VNC detectado')}"
            Remove-NetFirewallRule -DisplayName VNC1
            Remove-NetFirewallRule -DisplayName VNC2
            break }
        Set-Variable -Name VNC2 -Value (NETSTAT -AN | Select-String "5900" | Select-String "ESTABLISHED" -Quiet)
        if ( $VNC2 -eq $true ) {
            NETSTAT -AN | Select-String "5900" | Select-String "ESTABLISHED"
            Enable-NetFirewallRule -DisplayName VNC1
            Enable-NetFirewallRule -DisplayName VNC2
            powershell -WindowStyle hidden -Command "& {[System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms'); [System.Windows.Forms.MessageBox]::Show('Conexión VNC detectada y bloqueda pulsa aceptar para desbloquearla','VNC detectado')}"
            Remove-NetFirewallRule -DisplayName VNC1
            Remove-NetFirewallRule -DisplayName VNC2
            break }
            }}
"3" {
    echo "No cierres esta ventana para permanecer protegido"
    New-NetFirewallRule -DisplayName VyAdvisor -Enabled False -Protocol TCP -LocalPort 11100 -Direction Inbound -Action Block > $null
    New-NetFirewallRule -DisplayName VNC1 -Enabled False -Protocol TCP -LocalPort "5800" -Direction Inbound -Action Block > $null 
    New-NetFirewallRule -DisplayName VNC2 -Enabled False -Protocol TCP -LocalPort "5900" -Direction Inbound -Action Block > $null
    for (;;) { 
        Set-Variable -Name Veyon -Value (NETSTAT -AN | Select-String "11100" | Select-String "ESTABLISHED" -Quiet)
        if ( $Veyon -eq $true ) {
            NETSTAT -AN | Select-String "11100" | Select-String "ESTABLISHED"
            Enable-NetFirewallRule -DisplayName VyAdvisor
            powershell -WindowStyle hidden -Command "& {[System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms'); [System.Windows.Forms.MessageBox]::Show('Conexión Veyon detectada y bloqueda pulsa aceptar para desbloquearla','Veyon detectado')}"
            Remove-NetFirewallRule -DisplayName VyAdvisor
            break }
        Set-Variable -Name VNC1 -Value (NETSTAT -AN | Select-String "5800" | Select-String "ESTABLISHED" -Quiet)
        if ( $VNC1 -eq $true ) {
            NETSTAT -AN | Select-String "5800" | Select-String "ESTABLISHED"
            Enable-NetFirewallRule -DisplayName VNC1
            Enable-NetFirewallRule -DisplayName VNC2
            powershell -WindowStyle hidden -Command "& {[System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms'); [System.Windows.Forms.MessageBox]::Show('Conexión VNC detectada y bloqueda pulsa aceptar para desbloquearla','VNC detectado')}"
            Remove-NetFirewallRule -DisplayName VNC1
            Remove-NetFirewallRule -DisplayName VNC2
            break }
        Set-Variable -Name VNC2 -Value (NETSTAT -AN | Select-String "5900" | Select-String "ESTABLISHED" -Quiet)
        if ( $VNC2 -eq $true ) {
            NETSTAT -AN | Select-String "5900" | Select-String "ESTABLISHED"
            Enable-NetFirewallRule -DisplayName VNC1
            Enable-NetFirewallRule -DisplayName VNC2
            powershell -WindowStyle hidden -Command "& {[System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms'); [System.Windows.Forms.MessageBox]::Show('Conexión VNC detectada y bloqueda pulsa aceptar para desbloquearla','VNC detectado')}"
            Remove-NetFirewallRule -DisplayName VNC1
            Remove-NetFirewallRule -DisplayName VNC2
            break }}}
"4" { break }
}