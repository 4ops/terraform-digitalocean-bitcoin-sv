# Cloud resources configuration

variable "name" {
  type = string

  default = "bitcoin-sv"

  description = <<-DESCRIPTION
    Name of service.
    Used as name prefix when generating hostnames.
  DESCRIPTION
}

variable "servers" {
  type = number

  default = 1

  description = <<-DESCRIPTION
    Count of servers to create.
  DESCRIPTION
}

variable "random_id" {
  type = bool

  default = true

  description = <<-DESCRIPTION
    Appends random id to droplet's name if `true`.
  DESCRIPTION
}

variable "domain" {
  type = string

  default = ""

  description = <<-DESCRIPTION
    Domain name.
    Host will be registered in this domain if non-empty value assigned.
  DESCRIPTION
}

variable "domain_ttl" {
  type = number

  default = 300

  description = <<-DESCRIPTION
    TTL in seconds for domain records.
  DESCRIPTION
}

variable "region" {
  type = string

  description = <<-DESCRIPTION
    Required.
    DigitalOcean region for droplet creation.
  DESCRIPTION
}

variable "ssh_keys" {
  type = list

  default = []

  description = <<-DESCRIPTION
    List of SSH keys registered in DigitalOcean.
    User `root` authorized with this keys.
  DESCRIPTION
}

variable "tags" {
  type = list

  default = []

  description = <<-DESCRIPTION
    List of existing tags for droplet.
  DESCRIPTION
}

variable "size" {
  type = string

  default = "s-2vcpu-4gb"

  description = <<-DESCRIPTION
    Size of droplet.
  DESCRIPTION
}

variable "backups" {
  type = bool

  default = false

  description = <<-DESCRIPTION
    Enable backups feature for droplet.
  DESCRIPTION
}

variable "ipv6" {
  type = bool

  default = false

  description = <<-DESCRIPTION
    Enable IPv6 address on droplet.
  DESCRIPTION
}

variable "private_networking" {
  type = bool

  default = true

  description = <<-DESCRIPTION
    Enable DigitalOcean private networking.
  DESCRIPTION
}

variable "monitoring" {
  type = bool

  default = true

  description = <<-DESCRIPTION
    Enable DigitalOcean monitoring.
  DESCRIPTION
}

variable "volume_size" {
  type = number

  default = 100

  description = <<-DESCRIPTION
    Size of data volume in gigabytes.
    If zero, no volume will be created.
  DESCRIPTION
}

variable "trusted_sources" {
  type = list

  description = <<-DESCRIPTION
    Required.
    IP list to allow SSH and bitcoin rpc connections from.
  DESCRIPTION
}

# Provisioner confiuration

variable "provisioner_username" {
  type = string

  default = "provisioner"

  description = <<-DESCRIPTION
    This user will be added and used inside this module only.
  DESCRIPTION
}

# Service configuration

variable "image" {
  type = string

  default = "4ops/bitcoin-sv:v0.2.1"

  description = <<-DESCRIPTION
    Bitcoin SV docker image tag.
  DESCRIPTION
}

variable "testnet" {
  type = bool

  default = true

  description = <<-DESCRIPTION
    Use test network or main if `false`.
  DESCRIPTION
}

variable "rpc_user" {
  type = string

  default = "bitcoin-client"

  description = <<-DESCRIPTION
    Username for JSON-RPC connections.
  DESCRIPTION
}

variable "rpc_password" {
  type = string

  default = ""

  description = <<-DESCRIPTION
    Password for JSON-RPC connections.
    If empty, random password will be generated.
  DESCRIPTION
}

variable "extra_args" {
  type = list

  default = []

  description = <<-DESCRIPTION
    Bitcoin extra arguments.
  DESCRIPTION
}

variable "prune" {
  type        = number
  default     = 0
  description = <<-DESCRIPTION
    Reduce storage requirements by enabling pruning (deleting) of old blocks.
    This allows the pruneblockchain RPC to be called to delete specific blocks,
    and enables automatic pruning of old blocks if a target size in MiB is provided.
    This mode is incompatible with -txindex and -rescan.
    Warning: Reverting this setting requires re-downloading the entire blockchain.
    0 = disable pruning blocks
    1 = allow manual pruning via RPC
    >550 = automatically prune block files to stay under the specified target size in MiB
    Default: 0
  DESCRIPTION
}

variable "txindex" {
  type        = bool
  default     = false
  description = <<-DESCRIPTION
    Maintain a full transaction index, used by the getrawtransaction rpc call.
    Default: false
  DESCRIPTION
}

variable "onlynet" {
  type        = string
  default     = "ipv4"
  description = <<-DESCRIPTION
    Only connect to nodes in network <net> (ipv4, ipv6 or onion).
    Default: ipv4
  DESCRIPTION
}

# Exporter configuration

variable "bitcoin_exporter" {
  type        = bool
  default     = true
  description = <<-DESCRIPTION
    Installs bitcoin-exporter.
    Default: true
  DESCRIPTION
}
