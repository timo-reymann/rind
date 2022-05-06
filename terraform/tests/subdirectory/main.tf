module "this" {
  source   = "../../"
  runtime  = "cimg/python:3.9"
  pwd      = "code"
  main_cmd = "zip -r code.zip ."
}
