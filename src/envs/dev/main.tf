terraform { 
  cloud { 
    
    organization = "poridhi-iac" 

    workspaces { 
      name = "poridhi-dev" 
    } 
  } 
}
module "poridhi_dev" {
  source = "../../blueprint"
  vpc_name = "poridhi-dev-vpc"
  vpc_cidr = "10.10.0.0/16"
  public_subnets = ["10.10.1.0/24"]
  availability_zones = ["ap-southeast-1a"]
  custom_tags = {
    env= "poridhi-dev"
    team= "app"
    manage_by_tf = true
    workspace = "poridhi-dev"
  }
}