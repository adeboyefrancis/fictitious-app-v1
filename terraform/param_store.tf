# Parameter Store for Database Values

resource "aws_ssm_parameter" "db_secret_key" {
  name        = "/cloudtalents/startup/db_secret_key"
  type        = "SecureString"
  value       = var.secret_key
}

resource "aws_ssm_parameter" "db_username" {
  name        = "/cloudtalents/startup/db_username"
  type        = "String" 
  value       = var.db_username
}

resource "aws_ssm_parameter" "db_password" {
  name        = "/cloudtalents/startup/db_password"
  type        = "SecureString"
  value       = var.db_password
}

resource "aws_ssm_parameter" "rds_endpoint" {
  name        = "/cloudtalents/startup/database_endpoint"
  type        = "String"
  value       = aws_db_instance.rds_app_db.address
}

resource "aws_ssm_parameter" "s3_rds_bucket" {
  name        = "/cloudtalents/startup/image_storage_bucket_name"
  type        = "String"
  value       = aws_s3_bucket.s3-image-bucket.id
}

resource "aws_ssm_parameter" "cfd_image_domain" {
  name        = "/cloudtalents/startup/image_storage_cloudfront_domain"
  type        = "String"
  value       = aws_cloudfront_distribution.cf_s3_distribution.domain_name
}

# IAM policy for Webserver to read parameter store
resource "aws_iam_policy" "ec2_ssm_parameter_policy" {
  name        = "ec2_ssm_parameter_policy"
  description = "Allow webserver to read parameter store"
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "ssm:DescribeParameters",
          "ssm:GetParameters"
        ],
        "Resource" : "arn:aws:ssm:eu-west-1:${data.aws_caller_identity.current.account_id}:parameter/cloudtalents/startup/*"
      }
    ]
  })
}