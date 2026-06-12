# 🚀 Project Bedrock – InnovateMart EKS Deployment

## 📌 Overview
Project Bedrock is a production-grade cloud-native infrastructure deployed on AWS for InnovateMart Inc. It demonstrates a complete DevOps lifecycle using Infrastructure as Code, Kubernetes, CI/CD, and serverless architecture.

---

## 🏗️ Architecture Summary
- Amazon EKS cluster deployed in us-east-1
- VPC with public and private subnets across 2 Availability Zones
- Amazon RDS (MySQL & PostgreSQL) for managed relational data
- Amazon DynamoDB for NoSQL cart/session storage
- Amazon S3 for asset storage
- AWS Lambda for event-driven image processing
- Application Load Balancer (ALB) for external access
- CloudWatch for logging and observability

---

## 🌐 Application Access

Retail Store UI (ALB Endpoint):

http://k8s-retailap-retailui-dd768ff5c0-1632665587.us-east-1.elb.amazonaws.com

---

## ⚙️ Deployment Instructions

### 1. Initialize Terraform
```bash
terraform init

2. Plan Infrastructure
terraform plan

3. Apply Infrastructure
terraform apply
🔄 CI/CD Pipeline

Implemented using GitHub Actions:

Pull Request → triggers terraform plan
Merge to main → triggers terraform apply
📊 Observability
Amazon CloudWatch logs enabled for:
EKS Control Plane
Application containers
Logs accessible via AWS CloudWatch Console
🔐 Security
IAM user: bedrock-dev-view
AWS managed policy: ReadOnlyAccess
Kubernetes RBAC: View-only access in retail-app namespace
📦 Serverless Flow
S3 bucket receives uploaded files
AWS Lambda function bedrock-asset-processor is triggered
Logs filename to CloudWatch
📤 Terraform Outputs

Generated outputs:

cluster_endpoint
cluster_name
region
vpc_id
assets_bucket_name

Exported using:

terraform output -json > grading.json
🧹 Cleanup (IMPORTANT)

To avoid AWS charges:

terraform destroy -auto-approve
🏷️ Tagging Standard

All resources tagged with:

Project: karatu-2025-capstone
👨‍💻 Author

Christopher Ogwudire
AltSchool Cloud Engineering – Karatu 2025