module "vm" {
  source = "../../"

  hcloud_token = var.hcloud_token

  servers = {
    web-01 = {
      name        = "web-01"
      server_type = "cx22"
      image       = "ubuntu-24.04"
      location    = "nbg1"
      labels = {
        environment = "dev"
        role        = "web"
      }
    }
  }

  ssh_keys = {
    my-key = var.ssh_public_key
  }

  server_ssh_keys = ["my-key"]
}
