:: TODO: Make this into a powershell script which has its execution policy set from here
::start /wait powershell.exe Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

choco install googlechrome -y
choco install hackfont -y
choco install slack -y
choco install pyenv-win -y
choco install visualstudio2022community -y
choco install 7zip -y
choco install everything -y
choco install es -y
choco install googledrive -y
choco install rufus -y
choco install obsidian -y
choco install openvpn -y
choco install treesizefree -y
choco install vlc -y
choco install wireshark -y
choco install yubikey-manager -y
choco install nsis -y
choco install imagemagick -y
choco install inkscape -y
choco install dependencies -y
choco install rapr -y
choco install procmon -y
choco install dbgview -y
choco install regscanner -y
:: TODO: Map settings from git-bash GUI installer to git package parameters:
:: https://github.com/chocolatey-community/chocolatey-packages/blob/master/automatic/git.install/ARGUMENTS.md
::choco install git.install -y

:: NOTE: At the time of writing the wsl-ubuntu-2204 choco package has a checksum error
::choco install wsl-ubuntu-2204 -y
wsl --install

pyenv install 3.7.9
pyenv global 3.7.9

