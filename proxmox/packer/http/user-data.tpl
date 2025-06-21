#cloud-config
autoinstall:
  version: 1
  locale: en_US
  keyboard:
    layout: us
  identity:
    hostname: ${hostname}
    username: ${ssh_username}
    password: ${ssh_password_hash}
  ssh:
    install-server: true
    allow-pw: true
    disable_root: true
    ssh_quiet_keygen: true
    allow_public_ssh_keys: true
    authorized-keys:
      - ${ssh_public_key}
  network:
    version: 2
    ethernets:
      net0:
        match:
          name: "en*"
        dhcp4: true
  packages:
    - qemu-guest-agent
    - sudo
    - openssh-server
    # Additional packages can be added here
  storage:
    layout:
      name: direct
    swap:
      size: 0
  user-data:
    package_upgrade: false
    disable_root: false
    # Additional configuration can be added here
  late-commands:
    - echo '${ssh_username} ALL=(ALL) NOPASSWD:ALL' > /target/etc/sudoers.d/${ssh_username}
    - chmod 440 /target/etc/sudoers.d/${ssh_username}
  # force non-interactive installation    
  interactive-sections: []
  