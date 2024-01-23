output "external_ip" {
  value = [yandex_compute_instance_group.alb-vm-group.instances[*].network_interface[0].nat_ip_address]
}

output "internal_ip" {
  value = [yandex_compute_instance_group.alb-vm-group.instances[*].network_interface[0].ip_address]
}

output "db_host" {
  value = [yandex_mdb_postgresql_cluster.dev-cluster.host.0.fqdn]
}
