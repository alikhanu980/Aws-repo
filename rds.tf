resource "aws_db_instance" "default" {
  allocated_storage    = 20
  engine               = "mysql"         # Database engine type
  engine_version       = "8.0.32"        # Ensure this version is supported by the instance class
  instance_class       = "db.t3.micro"   # Instance class for the database
  db_name              = "mydatabase"    # Name of the initial database
  username             = "admin"         # Master username
  password             = "password"      # Master password
  skip_final_snapshot  = true            # Skip final snapshot on delete to avoid additional costs
  publicly_accessible  = true            # Whether the instance is publicly accessible
  storage_type         = "gp2"           # Storage type, General Purpose SSD

  # Optional settings
  backup_retention_period = 7           # Retain backups for 7 days
  multi_az                = true        # Deploys the database across multiple Availability Zones for high availability
  parameter_group_name    = "default.mysql8.0" # Use default parameter group for MySQL 8.0

  # Security group for the database
  vpc_security_group_ids = [aws_security_group.db_sg.id]
}

resource "aws_security_group" "db_sg" {
  name        = "db_sg"
  description = "Database security group"

  ingress {
    from_port   = 3306      # MySQL default port
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Open to all IPs (adjust this for your needs)
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # Allow all outbound traffic
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "db_sg"
  }
}
