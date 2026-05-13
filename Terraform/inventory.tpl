[node_a]
${node_ips["node_a"]}ansible_user=ec2-user ansible_ssh_private_key_file=/root/EKS.pem

[node_b]
${node_ips["node_b"]}ansible_user=ec2-user ansible_ssh_private_key_file=/root/EKS.pem

[docker_nodes:children]
node_a
node_b
