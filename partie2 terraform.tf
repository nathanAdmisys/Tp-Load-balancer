resource "scaleway_lb_frontend" "http" {
  lb_id         = scaleway_lb.my-lb.id
  zone          = "fr-par-1"
  protocol      = "http"
  port          = 80
  target_group_id = scaleway_lb_target_group.tg-web1.id
}

resource "scaleway_lb_frontend" "http2" {
  lb_id         = scaleway_lb.my-lb.id
  zone          = "fr-par-1"
  protocol      = "http"
  port          = 80
  target_group_id = scaleway_lb_target_group.tg-web2.id
}

resource "scaleway_lb_frontend" "http3" {
  lb_id         = scaleway_lb.my-lb.id
  zone          = "fr-par-1"
  protocol      = "http"
  port          = 80
  target_group_id = scaleway_lb_target_group.tg-web3.id
}

resource "scaleway_lb_backend" "backend1" {
  lb_id = scaleway_lb.my-lb.id
  name = "backend1"
  forward_protocol = "http"
  forward_port = "80"

health_check_http {
  uri = "/wp-admin/setup-config.php"
}
  
  server_ips = [
# scaleway_instance_ip.public_ip.address

# IP Instance serveur 1 web  
  "51.158.175.56",

# IP Instance serveur 2 web
  "20.199.81.12"

# IP Instance serveur 3 web
  "20.199.81.12"
]
}

resource "scaleway_lb_frontend" "frontend1" {
  lb_id = scaleway_lb.lb1.id
  backend_id = scaleway_lb_backend.backend1.id
  name = "frontend1"
  inbound_port = "80"
}

resource "scaleway_lb" "lb1" {
  name = "Load_Balancer_1_Projet"
  ip_id = scaleway_lb_ip.public_ip3.id
  zone = scaleway_lb_ip.public_ip3.zone
  type = "LB-GP-L"
}

#!/bin/bash
sudo apt update
sudo apt install apache2 -y
sudo apt install php php-mysql php-cgi php-cli php-gd -y
sudo apt install nfs-common -y
sudo mkdir /var/wwww
sudo mkdir /var/wwww/html
sudo mount 51.15.100.73:/mnt/nfs_share /var/www/html
