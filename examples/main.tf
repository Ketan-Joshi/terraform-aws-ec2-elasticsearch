module "prometheus" {
    source = "../"
    instance_type_elasticsearch = "t3.medium"
    volume_size_elasticsearch = "30"
    pem_key_name = "elasticsearch"
    vpc_cidr_block = ""
    vpc_id = ""
    subnet_id = ""
}