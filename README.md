# AWS VPC & EC2 with Terraform

Infrastructure as Code project that provisions a complete AWS network environment using Terraform.

## Architecture

- **VPC** with custom CIDR block
- **Public & Private Subnets**
- **Internet Gateway** for public access
- **NAT Gateway** for private subnet outbound traffic
- **Route Tables** and associations
- **Security Groups** controlling inbound/outbound traffic
- **EC2 Instances** deployed inside the network

## Project Structure

| File | Purpose |
|------|---------|
| `provider.tf` | AWS provider configuration |
| `var.tf` | Input variables |
| `vpcs.tf` | VPC definition |
| `subnets.tf` | Public and private subnets |
| `igw.tf` | Internet Gateway |
| `nat.tf` | NAT Gateway |
| `route_table.tf` | Route tables and associations |
| `SG.tf` | Security groups |
| `EC2.tf` | EC2 instances |

## Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/install) >= 1.0
- AWS account and configured credentials (`aws configure`)

## Usage

```bash
terraform init
terraform plan
terraform apply
```

To destroy all resources:

```bash
terraform destroy
```

## Author

**Menna Medhat Hassan**
[LinkedIn](https://linkedin.com/in/MennaMedhatt)
