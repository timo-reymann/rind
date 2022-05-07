terraform-lambda
===

Example showcasing the usage in an terraform module to build a lambda inside a docker container

# Usecase

We want to build a lambda function for python inside terraform, normally the build job runs with the cimg/python
convenience image, and executes terraform headless. In some cases we need to do changes locally, because in limitations
of the IAM user used to execute our IaC.

Our pipeline already runs with docker and therefore we just need to install the dependencies and are good to go.

For development all our DevOps engineers use macbooks. This way we make sure the build is always for linux systems.

Since terraform works state-based it will only suggest changes if the actual code has changed and doesnt care if we
run it locally or in our pipeline.
