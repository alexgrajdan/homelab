# Proxmox Terraform Configuration

This directory contains Terraform configuration files for managing resources on your Proxmox server.

## Prerequisites

- [Terraform](https://www.terraform.io/) installed
- Access to your Proxmox server and API credentials
- A VM template created either manually or with Packer

## Setup Instructions

1. **Configure Variables**

   Create a file named `secrets.auto.tfvars` (or use another supported method) with your Proxmox credentials and required variables. Example:

   ```hcl
   proxmox_api_url     = "https://your-proxmox:8006/api2/json"
   proxmox_api_token   = "root@pam!terraform=your-token"
   proxmox_node        = "proxmox-node"
   ```

2. **Initialize Terraform**

   Run the following command to initialize the Terraform working directory:

   ```sh
   terraform init
   ```

3. **Review the Execution Plan**

   Check what Terraform will do before applying changes:

   ```sh
   terraform plan
   ```

4. **Apply the Configuration**

   Apply the configuration to create or update resources:

   ```sh
   terraform apply
   ```

   Confirm the action when prompted.

## Notes

- Sensitive files like `secrets.auto.tfvars` are excluded from version control via `.gitignore`.
- Review and adjust the Terraform configuration files for your specific Proxmox environment.
- For more information, see the [Terraform Proxmox Provider documentation](https://registry.terraform.io/providers/Telmate/proxmox/latest/docs).