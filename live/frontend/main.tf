module "site" {
  source = "../../modules/static-site"

  name = var.name
  tags = {
    Project = "spherex"
    App     = "frontend"
  }
}
