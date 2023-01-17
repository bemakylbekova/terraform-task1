resource "aws_instance" "myinstance1" {
  ami           = "ami-0b5eea76982371e91"
  instance_type = "t2.micro"

  key_name = "bastion-key2"

  subnet_id = aws_subnet.subnet-public-1.id

  # List - []
  vpc_security_group_ids = ["${aws_security_group.ssh-sg.id}","${aws_security_group.http-sg.id}"]
  
  user_data                   = <<EOF
    #!/bin/bash 
    yum install httpd -y 
    service httpd start 
    chkconfig httpd on 
    echo "Hello, world from EC2-1" > /var/www/html/index.html
    EOF


  tags = {
    Project     = "VPC_Task"
    Environment = "Test"
    Team        = "DevOps"
    Created_by  = "Bermet_Akylbekova"
  }
}

resource "aws_instance" "myinstance2" {
  ami           = "ami-0b5eea76982371e91"
  instance_type = "t2.micro"

  key_name = "bastion-key2"

  subnet_id = aws_subnet.subnet-public-2.id

  # List - []
  vpc_security_group_ids = ["${aws_security_group.ssh-sg.id}","${aws_security_group.http-sg.id}"]

  user_data                   = <<EOF
    #!/bin/bash 
    yum install httpd -y 
    service httpd start 
    chkconfig httpd on 
    echo "Hello, world from EC2-1" > /var/www/html/index.html
    EOF


  tags = {
    Project     = "VPC_Task"
    Environment = "Test"
    Team        = "DevOps"
    Created_by  = "Bermet_Akylbekova"
  }
}

resource "aws_instance" "myinstance3" {
  ami           = "ami-0b5eea76982371e91"
  instance_type = "t2.micro"

  key_name = "bastion-key2"

  subnet_id = aws_subnet.subnet-public-3.id

  # List - []
  vpc_security_group_ids = ["${aws_security_group.ssh-sg.id}","${aws_security_group.http-sg.id}"]

  user_data                   = <<EOF
    #!/bin/bash 
    yum install httpd -y 
    service httpd start 
    chkconfig httpd on 
    echo "Hello, world from EC2-1" > /var/www/html/index.html
    EOF


  tags = {
    Project     = "VPC_Task"
    Environment = "Test"
    Team        = "DevOps"
    Created_by  = "Bermet_Akylbekova"
  }
}

