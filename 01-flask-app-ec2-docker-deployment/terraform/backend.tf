terraform {
  backend "s3" {
    bucket = var.bucketname
    key = "dev/terraform.tfstate"
    region = var.aws_region
    use_lockfile = true
  }
}