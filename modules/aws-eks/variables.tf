variable "cluster_name" {
  type        = string
  description = "EKS cluster identifier"
}

variable "kubernetes_version" {
  type        = string
  default     = "1.29"
  description = "Desired Kubernetes version"
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnet IDs where EKS cluster and nodes operate"
}

variable "instance_types" {
  type        = list(string)
  default     = ["t3.medium"]
  description = "EC2 instance types for node group"
}

variable "desired_size" {
  type        = number
  default     = 2
}

variable "min_size" {
  type        = number
  default     = 1
}

variable "max_size" {
  type        = number
  default     = 5
}

variable "tags" {
  type        = map(string)
  default     = {}
}
