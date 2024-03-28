# Create an AWS key pair
resource "aws_key_pair" "example" {
  key_name   = "example-key"
  public_key = file("~/.ssh/id_rsa.pub")
}


# Launch an EC2 instance in AWS
resource "aws_instance" "inst" {
  count         = var.instances
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = aws_key_pair.example.key_name
  subnet_id     = var.subnet

  tags = {
    Name = "GURU-${count.index}"
  }
}
