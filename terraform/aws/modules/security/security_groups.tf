data "http" "my_ip" {
  url = "http://ipv4.icanhazip.com"
}

resource "aws_security_group" "kubernetes" {

    name        = "kubernetes-sg"
    vpc_id      = var.cluster_vpc_id

    ingress {
        from_port   = "6443"
        to_port     = "6443"
        protocol    = "tcp"
        cidr_blocks = ["${chomp(data.http.my_ip.response_body)}/32"]
        description = "K8s para meu IP atual"
        self = true
    }

    ingress {
        from_port   = "22"
        to_port     = "22"
        protocol    = "tcp"
        cidr_blocks = ["${chomp(data.http.my_ip.response_body)}/32"]
        description = "Meu IP atual"
    }

    ingress {
        from_port   = "80"
        to_port     = "80"
        protocol    = "tcp"
        cidr_blocks = ["${chomp(data.http.my_ip.response_body)}/32"]
        description = "Meu IP atual"
    }

    ingress {
        from_port   = "443"
        to_port     = "443"
        protocol    = "tcp"
        cidr_blocks = ["${chomp(data.http.my_ip.response_body)}/32"]
        description = "Meu IP atual"
    }

    ingress {
        from_port = 0
        to_port = 65535
        protocol = "tcp"
        self = true
        description = "nodes"
    }

    ingress {
        from_port = 0
        to_port = 65535
        protocol = "udp"
        self = true
        description = "nodes"
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

}