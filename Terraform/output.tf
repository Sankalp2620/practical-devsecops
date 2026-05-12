output "node_ips" {
  value = {
    node_a = aws_instance.nodes["node_a"].public_ip
    node_b = aws_instance.nodes["node_b"].public_ip
  }
}