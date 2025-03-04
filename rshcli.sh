#Alias
alias exegol='sudo -E /home/rsh/.local/bin/exegol'
#docker
alias dockeron='sudo systemctl start docker'
alias dockeroff='sudo systemctl stop docker'
alias dockerstat='systemctl status docker'
#---
#func
#---
#service
servstart (){
  name=$1
  sudo systemctl start $name
}
servstop (){
  name=$1
  sudo systemctl stop $name
}
#---
#xend $port $protocol $vpn[file] 
nxend() {
  hport=$1
  protocol=$2
  locvpnfile=$3
  exegol start -p $hport --vpn $locvpnfile --desktop-config "vnc:127.0.0.1" 
}
#List of browsers
navigate () {
  browser=""
  if command -v brave-browser &> /dev/null; then 
    browser="brave-browser"
  elif command -v brave-browser-beta &> /dev/null; then
    browser="brave-browser-beta"
    
  elif command -v firefox &> /dev/null; then
    browser="firefox"
  else
    url=$1
    xdg-open $url
  fi

  if [ -n "$browser" ]; then 

    eval "$browser \"$1\""
  fi
}
#down 
down () {
  yt-dlp $1
}
#-change drive--
alias driveb='cd /mnt/hdd_512/'
alias sett='setoolkit'
alias bcap='sudo $HOME/go/bin/bettercap'
