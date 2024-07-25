# Terraform AWS Infrastructure

## Objective
Create AWS infrastructure including a VPC, multiple subnets, an EC2 instance, an RDS database, an S3 bucket, and a load balancer with autoscaling.

## Components
- VPC and Subnets
- Internet Gateway and NAT Gateway
- EC2 Instances
- Load Balancer
- RDS Database
- S3 Bucket

## Configuration Files
- `provider.tf`: Provider configuration file.
- `variables.tf`: Variables file for reusable configurations.
- `outputs.tf`: Outputs file to define output variables.
- `vpc.tf`: Network configuration file for VPC, subnets, and gateways.
- `ec2.tf`: Compute configuration file for EC2 instances and autoscaling.
- `rds.tf`: Database configuration file for the RDS instance.
- `s3.tf`: S3 bucket configuration file.

## Setup Instructions

### Prerequisites
- [Terraform](https://www.terraform.io/downloads.html) installed.
- AWS CLI installed and configured with your credentials.

### Steps
1. **Clone the Repository**:
    ```bash
    git clone <your-repo-url>
    cd terraform-aws-infrastructure
    ```

2. **Initialize Terraform**:
    ```bash
    terraform init
    ```

3. **Plan the Infrastructure**:
    ```bash
    terraform plan
    ```

4. **Apply the Configuration**:
    ```bash
    terraform apply
    ```

## Resources Description
- **VPC**: A virtual private cloud to host the network infrastructure.
- **Subnets**: Segmented network areas within the VPC.
- **Internet Gateway**: Allows internet access to resources within the VPC.
- **NAT Gateway**: Provides internet access to private subnets.
- **EC2 Instance**: Virtual servers for running applications.
- **Load Balancer**: Distributes incoming traffic across multiple EC2 instances.
- **RDS Database**: Managed relational database service.
- **S3 Bucket**: Storage service for storing data.

## Clean Up Instructions
To destroy the infrastructure, run:
```bash
terraform destroy
