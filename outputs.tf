output "ipv4" {
  value = module.server.ipv4
}

output "ipv4_private" {
  value = module.server.ipv4_private
}

output "ipv6" {
  value = module.server.ipv6
}

output "name" {
  value = module.server.name
}

output "fqdn" {
  value = module.server.fqdn
}

output "private_key" {
  value     = module.server.private_key
  sensitive = true
}

output "public_key" {
  value = module.server.public_key
}

output "rpc_password" {
  value     = local.rpc_password
  sensitive = true
}
