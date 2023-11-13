resource "aws_vpc" "cluster_vpc" {
    cidr_block = "12.0.0.0/16"
    enable_dns_support = true
    enable_dns_hostnames = true
}

# Internet Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.cluster_vpc.id
}

# Rota para o Internet Gateway
resource "aws_route" "internet_access" {
  route_table_id         = aws_vpc.cluster_vpc.main_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.gw.id
}