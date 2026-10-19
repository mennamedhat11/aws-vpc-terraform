# AWS VPC & EC2 with Terraform

![Terraform](https://img.shields.io/badge/Terraform-IaC-7B42BC?logo=terraform&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-VPC%20%7C%20EC2-FF9900?logo=amazonaws&logoColor=white)

Infrastructure as Code project that provisions a multi-AZ AWS network (VPC, public/private subnets, IGW, NAT Gateway, route tables, security group) and EC2 instances using Terraform. It runs against a **local AWS emulator** (`localhost:4566`), so it costs nothing to test.

## Architecture

```
                      Internet
                         │
                   ┌─────▼─────┐
                   │    IGW    │
                   └─────┬─────┘
          ┌──────────────▼───────────────┐
          │              VPC             │
          │                              │
          │  us-east-1a      us-east-1b  │
          │ ┌────────────┐ ┌───────────┐ │
          │ │ public_1   │ │ public_2  │ │
          │ │ EC2 + NAT  │ │ EC2       │ │
          │ └────────────┘ └───────────┘ │
          │ ┌────────────┐ ┌───────────┐ │
          │ │ private_1  │ │ private_2 │ │
          │ │ EC2        │ │ EC2       │ │
          │ └────────────┘ └───────────┘ │
          └──────────────────────────────┘
```

## Resources Created

| Resource | Details |
|----------|---------|
| VPC | CIDR set by `vpc_cidr` |
| Subnets | 2 public + 2 private across `us-east-1a` / `us-east-1b` |
| Internet Gateway | Public internet access |
| NAT Gateway | In `public_subnet_1`, with an Elastic IP |
| Route Tables | Public and private routing with associations |
| Security Group | `web-sg`, ingress port/protocol set by variables, all egress allowed |
| EC2 | 4 × `t3.micro`, one per subnet |

## Project Structure

| File | Purpose |
|------|---------|
| `provider.tf` | AWS provider pointed at the local emulator |
| `var.tf` | Input variables |
| `vpcs.tf` | VPC |
| `subnets.tf` | Public and private subnets |
| `igw.tf` | Internet Gateway |
| `nat.tf` | Elastic IP and NAT Gateway |
| `route_table.tf` | Route tables and associations |
| `SG.tf` | Security group and rules |
| `EC2.tf` | EC2 instances |
| `Floci/` | <short description of this folder> |

## Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/install) >= 1.0
- Local AWS emulator running on port `4566` (<how you start it, e.g. Floci>)

## Usage

```bash
git clone https://github.com/mennamedhat11/aws-vpc-terraform.git
cd aws-vpc-terraform

terraform init
terraform plan -var-file="terraform.tfvars"
terraform apply -var-file="terraform.tfvars"
```

Example `terraform.tfvars`:

```hcl
env                    = "dev"
vpc_cidr               = "10.0.0.0/16"
public_subnet_1_cidr   = "10.0.1.0/24"
public_subnet_2_cidr   = "10.0.2.0/24"
private_subnet_1_cidr  = "10.0.3.0/24"
private_subnet_2_cidr  = "10.0.4.0/24"
from_port              = 80
to_port                = 80
ip_protocol            = "tcp"
```

To remove everything:

```bash
terraform destroy -var-file="terraform.tfvars"
```

## Using Real AWS

Remove the `access_key`, `secret_key`, `skip_*` and `endpoints` settings from `provider.tf`, then configure real credentials with `aws configure`. Note that NAT Gateway and EC2 are billable on real AWS.

## What I Learned

- Designing a multi-AZ VPC with public and private tiers
- Routing with Internet Gateway and NAT Gateway
- Parameterizing infrastructure with variables
- Testing Terraform locally against an AWS emulator

## Author

**Menna Medhat Hassan** · DevOps & Cloud Engineer
[LinkedIn](https://linkedin.com/in/MennaMedhatt) · [Docker Hub](https://hub.docker.com/u/mennamedhat123) · [Credly](https://www.credly.com/users/menna-medhat.3691dc3e)
