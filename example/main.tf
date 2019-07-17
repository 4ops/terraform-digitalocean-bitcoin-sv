terraform {
  required_version = "~> 0.12.1"
}

# DigitalOcean token required
# ---
# provider "digitalocean" {
#   token = "...token..."
# }
#
# ...or...
#
# variable "do_token" {
#   default = "...token..."
# }
#
# provider "digitalocean" {
#   token = var.do_token
# }

module "bitcoin_testnet_no_volume" {
  source          = "../../terraform-digitalocean-bitcoin-sv"
  name            = "bsv-staging"
  region          = var.region
  trusted_sources = var.trusted_sources
  ssh_keys        = var.ssh_keys
  domain          = var.domain
  volume_size     = 0
}

module "bitcoin_mainnet_with_volume_and_txindex" {
  source          = "../../terraform-digitalocean-bitcoin-sv"
  name            = "bsv-txindex"
  region          = var.region
  trusted_sources = var.trusted_sources
  ssh_keys        = var.ssh_keys
  domain          = var.domain
  size            = "s-4vcpu-8gb"
  volume_size     = 300
  bitcoin_network = "mainnet"
  bitcoin_txindex = true
}

module "bitcoin_mainnet_with_prune" {
  source          = "../../terraform-digitalocean-bitcoin-sv"
  name            = "bsv-light"
  region          = var.region
  trusted_sources = var.trusted_sources
  ssh_keys        = var.ssh_keys
  domain          = var.domain
  size            = "s-2vcpu-4gb"
  volume_size     = 0
  bitcoin_network = "mainnet"
  bitcoin_prune   = 30000
}
