resource "yandex_vpc_network" "my_vpc" {
  name = var.VPC_name
}
resource "yandex_vpc_subnet" "public_subnet" {
  name           = var.subnet_name
  v4_cidr_blocks = var.v4_cidr_blocks
  zone           = var.subnet_zone
  network_id     = yandex_vpc_network.my_vpc.id
}