output "private_ip" {
  value = aws_instance.elasticsearch.private_ip
}
output "instance_id" {
  value = aws_instance.elasticsearch.id
}
output "elasticsearch_pem_file" {
  value = tls_private_key.ssh_private_key.private_key_pem
  sensitive = true
}
