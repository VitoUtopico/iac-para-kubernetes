resource "aws_subnet" "public_subnet_a" {
    vpc_id                  = aws_vpc.cluster_vpc.id
    cidr_block              = "12.0.16.0/20"
    map_public_ip_on_launch = true
    availability_zone       = format("%sa", var.aws_region)

}

# Associa a subnet public_subnet_cluster_1a à route table pública
resource "aws_route_table_association" "public_subnet_cluster_1a_association" {
    subnet_id      = aws_subnet.public_subnet_a.id
    route_table_id = aws_vpc.cluster_vpc.main_route_table_id
}

resource "aws_subnet" "public_subnet_b" {
    vpc_id                  = aws_vpc.cluster_vpc.id
    cidr_block              = "12.0.32.0/20"
    map_public_ip_on_launch = true
    availability_zone       = format("%sb", var.aws_region)

}

# Associa a subnet public_subnet_cluster_1b à route table pública
resource "aws_route_table_association" "public_subnet_cluster_1b_association" {
    subnet_id      = aws_subnet.public_subnet_b.id
    route_table_id = aws_vpc.cluster_vpc.main_route_table_id
}