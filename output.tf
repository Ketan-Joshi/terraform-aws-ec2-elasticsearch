output "private_ip" {
  value = aws_instance.elasticsearch.private_ip
}
output "elasticsearch_pem_file" {
  value = tls_private_key.ssh_private_key.private_key_pem
  sensitive = true
}
