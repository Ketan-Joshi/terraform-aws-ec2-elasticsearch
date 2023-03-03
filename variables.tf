variable "instance_type_elasticsearch" {
    description = "This defines elasticsearch Instance Size/Type"
    type        = string
    default     = ""
}
variable "volume_size_elasticsearch" {
    description = "This defines elasticsearch Instance Root Volume Size"
    type        = number
    default     = "30"
}
variable "pem_key_name" {
    description = "This defines Pem Key Name"
    type        = string
    default     = ""
}
variable "environment" {
    description = "This defines the Environment Tag"
    type        = string
    default     = ""
}
variable "vpc_id" {
    description = "This defines elasticsearch Instance VPC ID"
    type        = string
    default     = ""
}
variable "vpc_cidr_block" {
    description = "This defines elasticsearch Instance VPC CIDR Block"
    type        = string
    default     = ""
}
variable "subnet_id" {
    description = "This defines elasticsearch Instance VPC Subnet ID"
    type        = string
    default     = ""
}
