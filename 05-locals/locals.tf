locals {
  name          = "Sai"
  session       = "Training"
  instance_type = var.instance_names == "Mongodb" ? "t2.small" : var.instance_type
}
