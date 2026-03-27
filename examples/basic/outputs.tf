output "server_ids" {
  description = "Map of server IDs"
  value       = module.vm.server_ids
}

output "server_ipv4_addresses" {
  description = "Map of server IPv4 addresses"
  value       = module.vm.server_ipv4_addresses
}
