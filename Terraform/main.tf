terraform {
  required_providers{
    yandex = {
        source = "yandex-cloud/yandex"
    }
    
  }
  required_version = ">= 0.13"
}

provider "yandex" {
    cloud_id = "b1ga54bdcf92jadgq9l7"
    folder_id = "b1gnn3ip0mus2rmmjfr2"
    zone = "ru-central1-a"
}

resource "yandex_compute_instance" "hm-vm1" {
    name = "homework1"

    resources {
        cores = 2
        memory = 2
    }

    boot_disk {
        initialize_params {
            image_id = "fd8btqg2mh540ftne9p4"
        }
    }

    network_interface {
        subnet_id = "e9b4u5p5ieklbj6r3f87"
        nat       = true
    }
    
    metadata = {
        user-data = "${file("./meta.txt")}"
    }
}

resource "yandex_vpc_network" "homeworks-terraform" {
    name = "homeworks-terraform"
}

resource "yandex_vpc_subnet" "subnet-terraform" {
    name = "subnet1"
    zone = "ru-central1-a"
    network_id = "enpfe5ob16h0icrc5rh5"
    v4_cidr_blocks = ["192.168.10.0/24"]
}

output "internal_ip_address_vm_1" {
  value = yandex_compute_instance.hm-vm1.network_interface.0.ip_address
}
output "external_ip_address_vm_1" {
  value = yandex_compute_instance.hm-vm1.network_interface.0.nat_ip_address
}
