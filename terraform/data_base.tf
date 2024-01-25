resource "yandex_mdb_postgresql_cluster" "dev-cluster" {
  name        = "dev-cluster"
  environment = "PRESTABLE"
  network_id  = yandex_vpc_network.network-1.id
  security_group_ids = [yandex_vpc_security_group.dev_pg.id]

  config {
    version = 14
    resources {
      resource_preset_id = "s2.micro"
      disk_type_id       = "network-ssd"
      disk_size          = "20"
    }
  }
  
  host {
    zone = "ru-central1-a"
    name = "dev-pg-host"
    subnet_id = yandex_vpc_subnet.subnet-1.id
  }
}

resource "yandex_mdb_postgresql_user" "hexlet" {
  cluster_id = yandex_mdb_postgresql_cluster.dev-cluster.id
  name       = var.db_user
  password   = var.db_password

  depends_on = [ yandex_mdb_postgresql_cluster.dev-cluster ]
}

resource "yandex_mdb_postgresql_database" "db1" {
  cluster_id = yandex_mdb_postgresql_cluster.dev-cluster.id
  name = var.db_name
  owner = yandex_mdb_postgresql_user.hexlet.name

  depends_on = [ yandex_mdb_postgresql_cluster.dev-cluster ]
}


resource "yandex_vpc_security_group" "dev_pg" {
  name = "dev-pg"
  network_id = yandex_vpc_network.network-1.id

  ingress {
    description = "Postgres"
    port        = 6432
    protocol = "TCP"
    v4_cidr_blocks = [ "0.0.0.0/0" ]
  }
}
