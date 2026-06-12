resource "aws_db_subnet_group" "mysql" {
  name       = "bedrock-mysql-subnet-group"
  subnet_ids = [
    aws_subnet.private_a.id,
    aws_subnet.private_b.id
  ]

  tags = {
    Project = "karatu-2025-capstone"
  }
}

resource "aws_security_group" "mysql_sg" {
  name   = "bedrock-mysql-sg"
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Project = "karatu-2025-capstone"
  }
}

resource "aws_db_instance" "mysql" {
  identifier              = "bedrock-mysql"
  engine                  = "mysql"
  engine_version          = "8.0"
  instance_class          = "db.t3.micro"
  allocated_storage       = 20
  db_name                 = "catalog"
  username                = "admin"
  password                = "Admin12345!"
  skip_final_snapshot     = true
  publicly_accessible     = false
  db_subnet_group_name    = aws_db_subnet_group.mysql.name
  vpc_security_group_ids  = [aws_security_group.mysql_sg.id]

  tags = {
    Project = "karatu-2025-capstone"
  }
}
