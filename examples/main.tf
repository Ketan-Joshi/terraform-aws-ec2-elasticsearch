module "elasticsearch" {
    source = "../"
    instance_type_elasticsearch = "t3.large"
    volume_size_elasticsearch = "50"
    pem_key_name = "elasticsearch"
    vpc_cidr_block = ""
    vpc_id = ""
    subnet_id = ""
}