output "endpoints" {
  value = sort(concat(
    module.bitcoin_testnet_no_volume.endpoints,
    module.bitcoin_mainnet_with_volume_and_txindex.endpoints,
    module.bitcoin_mainnet_with_prune.endpoints,
  ))
}

output "ports" {
  value = module.bitcoin_testnet_no_volume.ports
}
