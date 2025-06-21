# Proxmox Ubuntu 24.04 Packer Templates

This directory contains Packer templates and scripts for building Ubuntu 24.04 VM templates on Proxmox.

## Prerequisites

- [Packer](https://www.packer.io/) installed
- Access to your Proxmox server and API credentials
- Ubuntu 24.04 ISO downloaded

## Setup Instructions

1. **Copy and Configure `user-data`**

   The file `user-data.tpl` is a template for cloud-init configuration.  
   Before running the build, rename it to `user-data`:

   ```sh
   mv user-data.tpl user-data
   ```

   Edit `user-data` as needed for your environment.

2. **Configure Variables**

   Create a secrets file (e.g., `secrets.pkrvars.hcl`) with your sensitive variables:

   ```hcl
   PROXMOX_URL        = "https://your-proxmox:8006/api2/json"
   PROXMOX_USERNAME   = "root@pam!packer"
   PROXMOX_TOKEN_SECRET = "your-token"
   PROXMOX_NODE       = "proxmox-node"
   VM_ID              = 9000
   ISO_FILE           = "/var/lib/vz/template/iso/ubuntu-24.04-live-server-amd64.iso"
   ISO_CHECKSUM       = "sha256:..."
   SSH_USERNAME       = "ubuntu"
   SSH_PASSWORD       = "your-password"
   SSH_PUBLIC_KEY     = "ssh-rsa AAAA..."
   HOSTNAME           = "ubuntu-template"
   ```

3. **Run the Build Script**

   Use the provided `build.sh` script to start the Packer build:

   ```sh
   ./build.sh
   ```

   This script will invoke Packer with the appropriate variables.

## Notes

- Sensitive files like `user-data` and `secrets.pkrvars.hcl` are excluded from version control via `.gitignore`.
- Review and adjust the template and variables for your specific Proxmox