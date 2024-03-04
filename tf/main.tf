resource "digitalocean_ssh_key" "default" {
  name       = "default"
  public_key = file("~/.ssh/id_ed25519.pub")
}

resource "digitalocean_droplet" "tor_bridge" {
  name     = "tor-bridge"
  region   = "nyc3"
  image    = "ubuntu-22-04-x64"
  size     = "s-1vcpu-2gb"
  ssh_keys = [resource.digitalocean_ssh_key.default.id]
  tags     = ["bridge"]
}

resource "digitalocean_firewall" "tor_fw" {
  name = "only-22-80-and-443"

  droplet_ids = [digitalocean_droplet.tor_bridge.id]

  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "9998"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "9999"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"] # Allow traffic to any destination
  }

  outbound_rule {
    protocol              = "udp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"] # Allow traffic to any destination
  }

  outbound_rule {
    protocol              = "icmp"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
}
