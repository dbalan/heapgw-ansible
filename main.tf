# Set the variable value in *.tfvars file
# or using -var="do_token=..." CLI option
variable "do_token" {}

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = "${var.do_token}"
}

resource "digitalocean_ssh_key" "gpg" {
  name = "gpg"
  public_key = "${file("./pubkey.pub")}"
}

resource "digitalocean_droplet" "heapgw0" {
  name               = "heapgw0"
  size               = "s-1vcpu-1gb"
  image              = "ubuntu-18-04-x64"
  region             = "nyc1"
  ipv6               = true
  private_networking = true
  ssh_keys           = ["${digitalocean_ssh_key.gpg.fingerprint}"]
}

resource "digitalocean_floating_ip" "heapgw0" {
  droplet_id = "${digitalocean_droplet.heapgw0.id}"
  region     = "${digitalocean_droplet.heapgw0.region}"
}

output gwaddr {
  value = "${digitalocean_floating_ip.heapgw0.ip_address}"
}