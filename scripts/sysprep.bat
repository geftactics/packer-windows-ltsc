if exist C:\script.bat del C:\script.bat

rem Disable WinRM when until Windows is not fully initialized / started
netsh advfirewall firewall set rule name="Allow WinRM HTTPS" new action=block
netsh advfirewall firewall set rule name="Windows Remote Management (HTTP-In)" new action=block

%WINDIR%\System32\Sysprep\sysprep.exe /generalize /oobe /shutdown /unattend:A:\unattend.xml