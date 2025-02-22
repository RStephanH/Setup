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
