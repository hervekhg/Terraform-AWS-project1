# Terraform-AWS-project1
This project is a code to build a complete IAAC in AWS with Terraform

The code contains these AWS resources:
- Autoscaling Group
- Launch Template
- Oracle RDS
- EFS
- Internal and External ALB
- ACM and Route 53 for external ALB
- Bucket
- SQS

The keys are store in Consul

# Command To Deploy
The project contains 3 terraform stack. In order to deploy it, you should deploy each stack
<code bash>
  # Deploy stack RDS
  terraform apply -auto-approve --var install_name=${install_name} --var version_lot="${version_lot}"
  # Deploy Stack Core
  terraform apply -auto-approve --var install_name=${install_name} --var version_lot="${version_lot}"
  # Deploy Stack Common
  terraform apply -auto-approve --var install_name=${install_name} --var version_lot="${version_lot}"
</code>
