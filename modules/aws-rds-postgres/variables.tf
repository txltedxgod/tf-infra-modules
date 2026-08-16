variable "identifier" {
  type        = string
  description = "Unique database identifier"
}

variable "vpc_id" {
  type        = string
  description = "Target VPC ID"
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnets for RDS subnet group"
}

variable "allowed_security_groups" {
  type        = list(string)
  default     = []
  description = "Security groups allowed to access DB"
}

variable "engine_version" {
  type        = string
  default     = "16.1"
}

variable "instance_class" {
  type        = string
  default     = "db.t4g.micro"
}

variable "allocated_storage" {
  type        = number
  default     = 20
}

variable "database_name" {
  type        = string
  default     = "appdb"
}

variable "master_username" {
  type        = string
  default     = "postgres_admin"
}

variable "master_password" {
  type        = string
  sensitive   = true
}

variable "multi_az" {
  type        = bool
  default     = false
}

variable "skip_final_snapshot" {
  type        = bool
  default     = true
}

variable "tags" {
  type        = map(string)
  default     = {}
}
