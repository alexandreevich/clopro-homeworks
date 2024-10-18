###cloud vars 3 vm / almalinux 
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "web_count" {
  type        = number
  default     = 2
  description = "Count"
}

variable "vm_web_name" {
  type        = string
  default     = "web"
  description = "Name VM"
}

variable "vm_web_platform" {
  type        = string
  default     = "standard-v1"
  description = "Platform standard"
}

variable "vm_web_preemptible" {
  type        = bool
  default     = true
  description = "Preemptible"
}

variable "vm_web_nat" {
  type        = bool
  default     = true
  description = "Network nat"
}

variable "vm_web_family" {
  type        = string
  default     = "ubuntu-2204-lts"
  description = "VM family"
}

variable "vm_web_disk_size" {
  type        = number
  default     = 10
  description = "Disk size"
}

variable "allow_stopping" {
  type        = bool
  default     = true
  description = "allow_stopping_for_update"
}

variable "vms_resources" {
  type              = map
  default           = {
     web = {
     cores = 2
     memory = 4
     core_fraction = 5
     }
  }
 }

 variable "vm_db" {
  type = list(object({
    vm_name = string
    cores   = number
    memory  = number
    core_fraction = number
    public_ip   = bool
    platform    = string
    preemptible = bool
    allow_stopping_for_update = bool
    metadata = object({
      serial-port-enable = number
      })
    boot_disk     = object({
      initialize_params = object({
        size     = number
      })
    })
  }))
  default = [
    {
      vm_name       = "main"
      cores         = 2
      memory        = 2
      core_fraction = 5
      public_ip     = true
      platform      = "standard-v1"
      preemptible   = true
      allow_stopping_for_update = true
      metadata     = {
        serial-port-enable = 1
      }
      boot_disk     = {
        initialize_params = {
          size     = 5
        }
      }
    },
    {
      vm_name       = "replica"
      cores         = 2
      memory        = 1
      core_fraction = 20
      public_ip     = true
      platform      = "standard-v1"
      preemptible   = true
      allow_stopping_for_update = true
      metadata     = {
        serial-port-enable = 1
      }
      boot_disk     = {
        initialize_params = {
          size     = 5
        }
      }
    }
  ]

}

variable "ssh-keys" {
  type        = string
  description = "secret-huna"
}

variable "disk_count" {
  type        = number
  default     = 3
  description = "Count disk"
}

variable "disk_name" {
  type        = string
  default     = "disk"
  description = "Disks name"
}

variable "disk_size" {
  type        = number
  default     = 1
  description = "Disks size"
}

variable "vm_storage_name" {
  type        = string
  default     = "storage"
  description = "vm_storage_name"
}

variable "vm_storage_core" {
  type        = number
  default     = 2
  description = "Cores"
}

variable "vm_storage_memory" {
  type        = number
  default     = 1
  description = "Memory size vm_storage"
}

variable "vm_storage_core_fraction" {
  type        = number
  default     = 100
  description = "storage_core_fraction"
}

variable "vm_storage_preemptible" {
  type        = bool
  default     = true
  description = "Storage vm scheduling policy preemptible"
}

### Variables for Service Account

variable "sa_name" {
  type        = string
  default     = "sa-storage"
}

### Variables for Object storage

variable "student_name" {
  type        = string
  default     = "alex111"
}

variable "acl" {
  type        = string
  default     = "public-read"
}

### Variables for Yandex_storage_object

variable "image_file_name" {
  type        = string
  default     = "image.jpg"
}

variable "image_file_path" {
  type        = string
  default     = "/Users/sashamac/terraform/data/image.jpg"
}


### Variablables for KMS

variable "kms_key_name"  {
  type        = string
  default     = "kms-key"
}

variable "kms_key_description" {
  type        = string
  default     = "symmetric key for object storage"
}

variable "default_algorithm" {
  type        = string
  default     = "AES_128"
}

variable "prevent_destroy" {
  type        = bool
  default     = true
}

### Variables for Private subnet

variable "private_subnet_name" {
  type        = string
  default     = "private"
}

variable "private_v4_cidr_blocks" {
  type        = list(string)
  default     = ["192.168.20.0/24"]
}

variable "private_subnet_zone" {
  type        = string
  default     = "ru-central1-a"
}

### Variables for Public subnet

variable "subnet_name" {
  type        = string
  default     = "public"
}

variable "v4_cidr_blocks" {
  type        = list(string)
  default     = ["192.168.10.0/24"]
}

variable "subnet_zone" {
  type        = string
  default     = "ru-central1-a"
}

variable "nat" {
  type        = bool
  default     = true
}

variable "nat_primary_v4_address" {
  type        = string
  default     = "192.168.10.254"
}