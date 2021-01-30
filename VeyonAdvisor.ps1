Set-Variable -Name Veyon -Value (NETSTAT -AN | Select-String "11100" | Select-String "ESTABLISHED" -Quiet)
New-NetFirewallRule -DisplayName VyAdvisorOUT -Enabled False -Program "C:\Program Files\Veyon\veyon-server.exe" -Direction Outbound -Action Block > $null 
New-NetFirewallRule -DisplayName VyAdvisorIN -Enabled False -Program "C:\Program Files\Veyon\veyon-server.exe" -Direction Inbound -Action Block > $null
echo "No cierres esta ventana para permanecer protegido"
echo "Desarrollado por IndustriasChan"
echo "industriaschan@gmail.com"
for (;;) { Set-Variable -Name Veyon -Value (NETSTAT -AN | Select-String "11100" | Select-String "ESTABLISHED" -Quiet)
    if ( $Veyon -eq $true )
    {
    Enable-NetFirewallRule -DisplayName VyAdvisorOUT
    Enable-NetFirewallRule -DisplayName VyAdvisorIN
    powershell -WindowStyle hidden -Command "& {[System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms'); [System.Windows.Forms.MessageBox]::Show('Conexión Veyon detectada y bloqueda','WARNING')}"
    exit
    }
    }