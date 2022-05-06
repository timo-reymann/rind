module "this" {
  source    = "../../"
  setup_cmd = "mkdir dist"
  main_cmd  = "echo 'very important artifact' > dist/artifact"
  artifacts = [
    "dist/"
  ]
}
