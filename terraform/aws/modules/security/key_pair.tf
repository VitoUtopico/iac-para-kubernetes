resource "aws_key_pair" "cluster_key" {
    key_name = "ec2.pub"
    public_key = file("../../ssh_keys/ec2_key.pub")
}