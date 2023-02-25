terraform {
  required_providers {
    linode = {
      source = "linode/linode"
      version = "1.27.1"
    }
  }
}

provider "linode" {
  token = var.jayson_terraform_token
}
resource "linode_instance" "terraform-dash" {
        image = "linode/ubuntu22.04"
        label = "dash-us-east"
        group = "HNS-frontend"
        region = "us-east"
        type = "g6-nanode-1"
        tags = [ "frontend" ]
        authorized_keys = [ var.ssh_keys_jayson ]
        root_pass = var.root_pass
}

resource "linode_instance" "terraform-ns1" {
        image = "linode/ubuntu22.04"
        label = "ns1-us-east"
        group = "HNS-backend"
        region = "us-east"
        type = "g6-nanode-1"
        tags = [ "backend" ]
        authorized_keys = [ var.ssh_keys_jayson ]
        root_pass = var.root_pass
}

resource "linode_instance" "terraform-ns2" {
        image = "linode/ubuntu22.04"
        label = "ns2-us-central"
        group = "HNS-backend"
        region = "us-central"
        type = "g6-nanode-1"
        tags = [ "backend" ]
        authorized_keys = [ var.ssh_keys_jayson ]
        root_pass = var.root_pass
}