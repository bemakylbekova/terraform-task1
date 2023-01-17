resource "aws_key_pair" "bastion-key2" {
  key_name   = "bastion-key2"
  public_key = file("~/.ssh/id_rsa.pub")

  tags = {
    Project     = "VPC_Task"
    Environment = "Test"
    Team        = "DevOps"
    Created_by  = "Bermet_Akylbekova"
  }
}