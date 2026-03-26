# =============================================================================
# PROVIDER VARIABLES
# =============================================================================

variable "hcloud_token" {
  description = "Hetzner Cloud API token"
  type        = string
  sensitive   = true
}

# =============================================================================
# SERVERS MAP (for_each support)
# =============================================================================

variable "servers" {
  description = "Map of server configurations. Each key is a unique identifier for the server."
  type        = any
  default     = {}
}

# =============================================================================
# BASIC SERVER SETTINGS (defaults for servers map)
# =============================================================================

variable "server_type" {
  description = "Server type (e.g., cx22, cx32, cx42, cpx11, cpx21, cax11)"
  type        = string
  default     = "cx22"
  validation {
    condition     = can(regex("^(cx|cpx|ccx|cax)[0-9]+$", var.server_type))
    error_message = "Server type must follow Hetzner naming convention (e.g., cx22, cpx11, cax11)."
  }
}

variable "image" {
  description = "OS image name or ID (e.g., ubuntu-24.04, debian-12, rocky-9, alma-9)"
  type        = string
  default     = "ubuntu-24.04"
}

variable "location" {
  description = "Server location (e.g., nbg1, fsn1, hel1, ash, hil)"
  type        = string
  default     = "nbg1"
  validation {
    condition     = contains(["nbg1", "fsn1", "hel1", "ash", "hil", "sin"], var.location)
    error_message = "Location must be one of: nbg1 (Nuremberg), fsn1 (Falkenstein), hel1 (Helsinki), ash (Ashburn), hil (Hillsboro), sin (Singapore)."
  }
}

variable "labels" {
  description = "Map of labels to apply to resources"
  type        = map(string)
  default     = {}
}

# =============================================================================
# SERVER BEHAVIOR SETTINGS
# =============================================================================

variable "backups" {
  description = "Enable automatic backups"
  type        = bool
  default     = false
}

variable "delete_protection" {
  description = "Enable delete protection (prevents accidental deletion)"
  type        = bool
  default     = false
}

variable "rebuild_protection" {
  description = "Enable rebuild protection (prevents accidental rebuild)"
  type        = bool
  default     = false
}

variable "keep_disk" {
  description = "Keep disk when scaling down server type"
  type        = bool
  default     = false
}

variable "allow_deprecated_images" {
  description = "Allow use of deprecated images"
  type        = bool
  default     = false
}

# =============================================================================
# SSH KEY SETTINGS
# =============================================================================

variable "ssh_keys" {
  description = "Map of SSH key names to public key content to create. Keys are the name, values are the public key string."
  type        = map(string)
  default     = {}
}

variable "server_ssh_keys" {
  description = "List of SSH key names or IDs to attach to servers (references keys created by ssh_keys variable or existing keys)"
  type        = list(string)
  default     = []
}

# =============================================================================
# NETWORK SETTINGS
# =============================================================================

variable "networks" {
  description = "Map of network configurations to create. Each key is the network name."
  type        = any
  default     = {}
}

variable "subnets" {
  description = "Map of subnet configurations to create."
  type        = any
  default     = {}
}

variable "network_zone" {
  description = "Default network zone for subnets (eu-central, us-east, us-west, ap-southeast)"
  type        = string
  default     = "eu-central"
  validation {
    condition     = contains(["eu-central", "us-east", "us-west", "ap-southeast"], var.network_zone)
    error_message = "Network zone must be one of: eu-central, us-east, us-west, ap-southeast."
  }
}

variable "network_keys" {
  description = "Default list of network keys to attach servers to"
  type        = list(string)
  default     = []
}

# =============================================================================
# PUBLIC NETWORK SETTINGS
# =============================================================================

variable "public_ipv4_enabled" {
  description = "Enable public IPv4 for servers"
  type        = bool
  default     = true
}

variable "public_ipv6_enabled" {
  description = "Enable public IPv6 for servers"
  type        = bool
  default     = true
}

# =============================================================================
# FIREWALL SETTINGS
# =============================================================================

variable "firewalls" {
  description = "Map of firewall configurations to create. Each key is the firewall name."
  type        = any
  default     = {}
}

variable "firewall_keys" {
  description = "Default list of firewall keys to attach to servers"
  type        = list(string)
  default     = []
}

# =============================================================================
# PLACEMENT GROUPS
# =============================================================================

variable "placement_groups" {
  description = "Map of placement group configurations to create. Each key is the placement group name."
  type        = any
  default     = {}
}

variable "placement_group_key" {
  description = "Default placement group key to assign to servers"
  type        = string
  default     = null
}

# =============================================================================
# CLOUD-INIT / USER DATA
# =============================================================================

variable "user_data" {
  description = "Cloud-init user data script or configuration"
  type        = string
  default     = null
}

# =============================================================================
# VOLUME SETTINGS
# =============================================================================

variable "volumes" {
  description = "Map of volume configurations to create and attach to servers."
  type        = any
  default     = {}
}

variable "volume_automount" {
  description = "Default automount setting for volumes"
  type        = bool
  default     = false
}

variable "volume_format" {
  description = "Default filesystem format for volumes (ext4, xfs)"
  type        = string
  default     = "ext4"
  validation {
    condition     = contains(["ext4", "xfs"], var.volume_format)
    error_message = "Volume format must be one of: ext4, xfs."
  }
}

# =============================================================================
# REVERSE DNS
# =============================================================================

variable "rdns" {
  description = "Default reverse DNS pointer for server IPv4 address"
  type        = string
  default     = null
}
