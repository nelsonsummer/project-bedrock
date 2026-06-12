output "cluster_endpoint" {
  description = "Endpoint for EKS control plane"
  value       = try(aws_eks_cluster.main.endpoint, "")
}

output "cluster_name" {
  description = "Kubernetes Cluster Name"
  value       = "project-bedrock-cluster"
}

output "region" {
  description = "AWS Region"
  value       = "us-east-1"
}

output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

output "assets_bucket_name" {
  description = "S3 Bucket for Assets"
  value       = "bedrock-assets-alt-soe-025-3369"
}

