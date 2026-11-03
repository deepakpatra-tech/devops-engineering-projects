terraform {
  backend "s3" {
    bucket = "cloudx-terraform-state-deepak-2026"
    key = "dev/terraform.tfstate"
    region = "ap-south-1"
    use_lockfile = true
  }
}