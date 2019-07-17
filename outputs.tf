output "endpoints" {
  value = compact(concat(
    digitalocean_droplet.server.*.ipv4_address_private,
    digitalocean_droplet.server.*.ipv4_address,
    digitalocean_droplet.server.*.ipv6_address,
  ))
}

output "ports" {
  value = [
    {
      name     = "json-rpc",
      protocol = "tcp",
      port     = var.bitcoin_network == "mainnet" ? 8332 : 18332,
    }
  ]
}
