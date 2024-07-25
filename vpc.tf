resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "main-vpc"
  }
}

resource "aws_subnet" "main" {
  count      = length(var.subnet_cidr)
  vpc_id     = aws_vpc.main.id
  cidr_block = element(var.subnet_cidr, count.index)

  tags = {
    Name = "main-subnet-${count.index}"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main-igw"
  }
}

resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "main-route-table"
  }
}

resource "aws_route_table_association" "main" {
  count          = length(var.subnet_cidr)
  subnet_id      = element(aws_subnet.main.*.id, count.index)
  route_table_id = aws_route_table.main.id
}
