# Script per instal·lar o desinstal·lar WebServer ISS.
#Author - Jordi Forés Garcia


Write-Output "--Instsallation Web Server IIS Menu--"
Write-Output "Install(1)"
Write-Output "Unistall(2)"

for ($i = 0; $true; $i++) {
    $User = Read-Host -Prompt 'Choose a option:'
    if($User -eq 1){        
        Write-Output "Checking if its already install"
        $isInstalled = ((Get-WindowsFeature -Name Web-Server).installed)
        if($isInstalled -eq $false){
            Write-Output "Installing..."
            Install-WindowsFeature Web-Server -IncludeManagementTools -IncludeAllSubFeature -Confirm:$false #Optional -IncludeAllSubFeature
            Write-Output "Installation Complete"
            break
        }else{
            Write-Output " IIS Server (WebServer) is already istalled"
            break
        }
    }elseif($User -eq 2){
        Write-Output "Checking if its install"
        $isInstalled = ((Get-WindowsFeature -Name Web-Server).installed)
        if($isInstalled -eq $true){
            Write-Output "Unistalling IIS Server (WebServer)"
            Uninstall-WindowsFeature -Remove Web-Server
            Write-Output "Unistall Done"
            break
        }else{
            Write-Output " IIS Server (WebServer) isn't installed"
            break            
        }
    }else{
        Write-Output "--Instsallation Web Server IIS Menu--"
        Write-Output "Install(1)"
        Write-Output "Unistall(2)"
    }
}