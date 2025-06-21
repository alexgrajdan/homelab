variable "PROXMOX_URL" {
  type = string
}

variable "PROXMOX_TOKEN_ID" {
  type      = string
  sensitive = true
}

variable "PROXMOX_TOKEN_SECRET" {
  type      = string
  sensitive = true
}

variable "PUBLIC_SSH_KEY" {
  # NOTE This is the public SSH key, you want to upload to VMs and LXC containers.
  type      = string
  sensitive = true
}

variable "PROXMOX_CI_USER" {
  type      = string
  sensitive = true
}

variable "PROXMOX_CI_PASSWORD" {
  type      = string
  sensitive = true
}

variable "VM_ID" {
  description = "The VM ID for the Proxmox VM."
  type        = number  
}

variable "PROXMOX_NODE" {
  description = "The Proxmox node where the VM will be created."
  type        = string  
}

variable "VM_TEMPLATE" {
  description = "The Proxmox VM template to clone from."
  type        = string
}
