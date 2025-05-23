# Prefix tagging resources

variable "prefix" {
  description = "Prefix for resources in AWS"
  default     = "tch-dev"
}

variable "project" {
  description = "Project name for tagging resources"
  default     = "dev-vm"
}

variable "contact" {
  description = "Contact email for tagging resources"
  default     = "adeboye.francis@icloud.com"
}

variable "region" {
  description = "Primary resource region"
  default     = "eu-west-1"

}

variable "custom_ami_version" {
  type = string
}

variable "instance_type" {
  default = "t2.micro"
}

variable "db_username" {
  type = string
  sensitive = true
  
}
variable "db_password" {
  type        = string
  sensitive   = true
}

variable "s3_name" {
  type = string
  default = "rds-s3-image"
}


variable "secret_key" {
  type = string
  sensitive = true
}