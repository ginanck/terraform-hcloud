output "server_ids" {
  description = "Map of server IDs"
  value       = module.vm.server_ids
}

output "server_ipv4_addresses" {
  description = "Map of server IPv4 addresses"
  value       = module.vm.server_ipv4_addresses
}

output "network_ids" {
  description = "Map of network IDs"
  value       = module.vm.network_ids
}

output "firewall_ids" {
  description = "Map of firewall IDs"
  value       = module.vm.firewall_ids
}

output "volume_ids" {
  description = "Map of volume IDs"
  value       = module.vm.volume_ids
}
