provider "aws" {
  region = "eu-west-2"
}
resource "aws_instance" "demo-server" {
    ami = "ami-008ea0202116dbc56"
    instance_type = "t2.micro"
    key_name = "abc"
    security_groups = [aws_security_group.demo-sg.name]

}
resource "aws_security_group" "demo-sg" {
  name        = "demo-sg"
  description = "SSH Traffic"
  
  ingress{
    description = "SSH Access"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress{
    description = "SSH Access"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  }

