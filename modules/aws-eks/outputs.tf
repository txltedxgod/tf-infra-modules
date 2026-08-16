output "cluster_endpoint" {
  value       = aws_eks_cluster.main.endpoint
  description = "EKS control plane API endpoint"
}

output "cluster_name" {
  value       = aws_eks_cluster.main.name
  description = "EKS cluster name"
}

output "cluster_certificate_authority_data" {
  value       = aws_eks_cluster.main.certificate_authority[0].data
  description = "Base64 encoded certificate data required to communicate with cluster"
}
