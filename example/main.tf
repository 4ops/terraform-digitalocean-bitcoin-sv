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

module "development_mempool" {
  source          = "../../terraform-digitalocean-bitcoin-sv"
  name            = "bsv-test-txpool"
  region          = "ams3"
  trusted_sources = ["0.0.0.0/0", "::/0"]
  ssh_keys        = var.ssh_keys
  volume_size     = 0
  prune           = 10000
}

module "development_transactions" {
  source          = "../../terraform-digitalocean-bitcoin-sv"
  name            = "bsv-test-txindex"
  region          = "ams3"
  trusted_sources = ["0.0.0.0/0", "::/0"]
  ssh_keys        = var.ssh_keys
  volume_size     = 100
  txindex         = true
}

module "production_mempool" {
  source          = "../../terraform-digitalocean-bitcoin-sv"
  name            = "bsv-main-txpool"
  servers         = 2
  region          = "ams3"
  trusted_sources = ["0.0.0.0/0", "::/0"]
  ssh_keys        = var.ssh_keys
  volume_size     = 0
  testnet         = false
  prune           = 10000
}

module "production_transactions" {
  source          = "../../terraform-digitalocean-bitcoin-sv"
  name            = "bsv-main-txindex"
  servers         = 2
  region          = "ams3"
  trusted_sources = ["0.0.0.0/0", "::/0"]
  ssh_keys        = var.ssh_keys
  volume_size     = 200
  testnet         = false
  txindex         = true
}
