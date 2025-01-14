module "aws" {
  source    = "./modules/aws_instance"
  count     = var.enable_aws ? 1 : 0
  instances = var.instance_count
  subnet    = var.aws_subnet
}


module "azure" {
  source                  = "./modules/azure_instance"
  count                   = var.enable_aws ? 1 : 0
  instances               = var.instance_count
  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location
}


