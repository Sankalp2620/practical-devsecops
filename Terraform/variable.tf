variable "ami_id" {
    description = "The AMI ID to use for the EC2 instances"
    type        = string
    default = "ami-0c94855ba95c71c99" # Amazon Linux 2 AMI (HVM), SSD Volume Type
}
variable "instance_type" {
    description = "The instance type to use for the EC2 instances"
    type        = string
    default     = "t2.micro"
}

variable "key_name" {
    description = "The name of the SSH key pair to use for the EC2 instances"
    type        = string
    default     = "Docker-pair" # Replace with your actual key pair name 
}