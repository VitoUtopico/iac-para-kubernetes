resource "aws_instance" "control_planes" {

    count = var.control_plane_instance_count
    ami = var.ami_x64
    instance_type = var.kubernetes_control_plane_instance_type

    subnet_id = var.subnet_a_id
    associate_public_ip_address = true

    vpc_security_group_ids = [ 
        var.sg
    ]

    user_data  = templatefile(
        "../scripts/userdata.sh",
        {hostname  = format("k8s-control-plane-%s", count.index)}
    )

    key_name = var.key_name
    
    tags = { 
        Name = format("k8s-control-plane-%s", count.index)
    }
}

resource "aws_instance" "nodes" {

    count = var.nodes_instance_count
    ami = var.ami_x64
    instance_type = var.kubernetes_nodes_instance_type

    subnet_id = var.subnet_b_id
    associate_public_ip_address = true

    vpc_security_group_ids = [ 
        var.sg
    ]
    
    user_data = templatefile(
        "../scripts/userdata.sh",
        {hostname = format("k8s-node-%s", count.index)}
    )

    key_name = var.key_name
    
    tags = { 
        Name = format("k8s-node-%s", count.index)
    }
}