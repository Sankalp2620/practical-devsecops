resource "aws_instance" "nodes" {
  for_each               = toset(["node_a", "node_b"])
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.docker_sg.id]

  tags = {
    Name = "Node-${upper(each.value)}"
  }
}

resource "aws_security_group" "docker_sg" {
    name        = "docker-sg"
    description = "Security group for Docker nodes"
    vpc_id      = aws_vpc.docker_vpc.id
    
    dynamic "ingress" {
        for_each = [22, 2376, 2377, 7946, 4789, 8500]
        content {
            from_port   = ingress.value
            to_port     = ingress.value
            protocol    = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }
    
    egress = {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}