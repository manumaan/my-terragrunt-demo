resource "aws_instance" "instance" {
  ami = "ami-090fa75af13c156b4"
  instance_type = "t2.micro"

  tags = {
    Name = "dev-instance",
    account_tag = var.account_tag
    region_tag = var.region_tag
  }
}