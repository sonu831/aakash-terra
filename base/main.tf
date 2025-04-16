resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = merge(
    var.tags,
    {
      Name        = "${var.environment}-vpc"
      Environment = var.environment
    }
  )
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    var.tags,
    {
      Name        = "${var.environment}-igw"
      Environment = var.environment
    }
  )
}

resource "aws_subnet" "public" {
  count             = length(var.public_subnet_cidrs)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public_subnet_cidrs[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = merge(
    var.tags,
    {
      Name        = "${var.environment}-public-${count.index + 1}"
      Environment = var.environment
    }
  )
}

resource "aws_subnet" "private" {
  count             = length(var.private_subnet_cidrs)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidrs[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = merge(
    var.tags,
    {
      Name        = "${var.environment}-private-${count.index + 1}"
      Environment = var.environment
    }
  )
}

resource "aws_nat_gateway" "main" {
  count         = var.single_nat_gateway ? 1 : length(var.public_subnet_cidrs)
  subnet_id     = aws_subnet.public[count.index].id
  allocation_id = aws_eip.nat[count.index].id

  tags = merge(
    var.tags,
    {
      Name        = "${var.environment}-nat-${count.index + 1}"
      Environment = var.environment
    }
  )
}

resource "aws_eip" "nat" {
  count = var.single_nat_gateway ? 1 : length(var.public_subnet_cidrs)

  tags = merge(
    var.tags,
    {
      Name        = "${var.environment}-eip-${count.index + 1}"
      Environment = var.environment
    }
  )
}

resource "aws_ecr_repository" "main" {
  name = "${var.environment}-repository"

  image_scanning_configuration {
    scan_on_push = var.ecr_scan_on_push
  }

  tags = merge(
    var.tags,
    {
      Name        = "${var.environment}-ecr"
      Environment = var.environment
    }
  )
} 