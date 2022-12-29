# Defined in - @ line 1
function unspoof --wraps='sudo ifconfig en0 ether 3c:22:fb:73:2c:93' --wraps='ifconfig en0 | grep ether 3c:22:fb:73:2c:93' --description 'alias unspoof=sudo ifconfig en0 ether 3c:22:fb:73:2c:93'
  set mac 3c:22:fb:73:2c:93
  sudo spoof-mac set $mac en0
  echo "MAC address set to" $mac
end
