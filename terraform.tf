variable "project_id" {
  type        = string
  default = "f8f64f6d-0933-4758-be35-c07395306199"
}

terraform {
  required_providers {
    scaleway = {
      source = "scaleway/scaleway"
    }
  }
  required_version = ">= 0.13"
}

provider "scaleway" {
  zone   = "fr-par-1"
  region = "fr-par"
  access_key = "SCWM5GEYETRMWHBA34GX"
  secret_key = "dbccfad4-d42c-4b81-b1e0-83158645154b"
  project_id = var.project_id
}

resource "scaleway_instance_ip" "public_ip" {
  count = 3
}

resource "scaleway_instance_security_group" "web" {
  inbound_default_policy  = "drop"
  outbound_default_policy = "accept"

  inbound_rule {
    action = "accept"
    port = 80
    ip_range = "0.0.0.0/0"
  }

  inbound_rule {
    action = "accept"
    port   = 22
    ip_range = "0.0.0.0/0"
  }
}
resource "scaleway_instance_server" "server-web1" {
  project_id = var.project_id
  name = "Web1-Instance"
  type       = "DEV1-S"
  image      = "debian_bullseye"
  ip_id = scaleway_instance_ip.public_ip[0].id
  security_group_id = scaleway_instance_security_group.web.id
  root_volume {
    size_in_gb  = 10
   }
}

resource "scaleway_instance_server" "server-web2" {
  project_id = var.project_id
  name = "Web2-Instance"
  type       = "DEV1-S"
  image      = "debian_bullseye"
  ip_id = scaleway_instance_ip.public_ip[1].id
  security_group_id = scaleway_instance_security_group.web.id
  root_volume {
    size_in_gb  = 10
   }
}

resource "scaleway_instance_server" "server-web3" {
  project_id = var.project_id
  name = "Web3-Instance"
  type       = "DEV1-S"
  image      = "debian_bullseye"
  ip_id = scaleway_instance_ip.public_ip[2].id
  security_group_id = scaleway_instance_security_group.web.id
   root_volume {
    size_in_gb  = 10
   }
}

