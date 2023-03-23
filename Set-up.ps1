# Makes .ps1 scripts executable -- Needed to run this
# Set-ExecutionPolicy RemoteSigned -Scope CurrentUser # Optional: Needed to run a remote script the first time

# Installs scoop
irm get.scoop.sh | iex

# Packages in the default bucket
scoop install git 7zip python docker docker-compose winget 

# Packages in the extras bucket
scoop bucket add extras
scoop install vivaldi vscodium powertoys notepadplusplus rufus
scoop install etcher discord plex-desktop autohotkey sharex 
# With Spotify click open when a pop up screen comes up if it still doesn't continue the script then just comment out all the lines you have run through before it stopped
scoop install cheat-engine cyberduck tabby vlc spotify
scoop install github wingetui filezilla wireshark rainmeter

# Packages in the nerd-fond bucket
scoop bucket add nerd-fonts
scoop install Font-Awesome

# Packages in the versions bucket
scoop bucket add versions
scoop install steam

# Packages in the non-portable bucket
scoop bucket add nonportable
scoop install zerotier-np teracopy-np


# Winget Packages
winget install -e --id Microsoft.WindowsTerminal --accept-source-agreements
winget install -e --id xanderfrangos.twinkletray
winget install -e --id EpicGames.EpicGamesLauncher
winget install -e --id Docker.DockerDesktop
winget install -e --id opticos.gwsl
winget install -e --id Canonical.Ubuntu.2004
winget install -e --id Ubisoft.Connect
winget install -e --id Files-Community.Files


# WSL install
# Run as Administrator to install WSL
wsl --install


#NEED TO RUN IN ADMIN POWERSHELL
# Windows debloat tool -- Chris titus tech
#iwr -useb https://christitus.com/win | iex
