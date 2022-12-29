function mount_carbonate
    sshfs \
    -o IdentityFile=~/.ssh/id_rsa_laptop,auto_cache,reconnect,defer_permissions,Compression=no \
    mpjuers@carbonate:/ /Volumes/Carbonate/
end
