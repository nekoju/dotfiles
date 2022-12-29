# Defined in - @ line 1
function spoof --wraps='sudo ifconfig en0 ether 5e:e1:96:43:4c:66' --description alias\ spoof=sudo\ ifconfig\ en0\ ether\ 5e:e1:96:43:4c:66\n
  set mac 5e:e1:96:43:4c:66
  sudo spoof-mac set $mac en0
  echo "MAC address set to" $mac
end
