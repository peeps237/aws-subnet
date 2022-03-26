module "subnet" {
  source = "..//"

  m_app_name = "vpc-etrz-dev-public-eu-west-1c"

  m_vpc_id            = "10.240.122.2"
  m_cidr_block        = "10.240.122.0/23"
  m_availability_zone = "eu-west-1c"
  m_subnet_label      = "subnet_label"
  m_tags = {
    Application = "etr-sam"
    AppDomain   = "subnet"
    Environment = "dev"
  }
}
