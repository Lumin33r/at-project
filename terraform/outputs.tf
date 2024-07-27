output "instance_arn" {
  description = "arn of EC2 instance"
  value       = aws_instance.troy-project14.arn
}

output "instance_id" {
  description = "ID of EC2 instance"
  value       = aws_instance.troy-project14.id
}

output "vpc_security_group_ids" {
  description = "vpc sg of EC2 instance"
  value       = aws_instance.troy-project14.vpc_security_group_ids
}
 
output "instance_public_ip" {
   description = "Public IP of EC2 instance"
   value       = aws_instance.troy-project14.public_ip
}

locals {
  output_data = {
    instance_arn          = aws_instance.troy-project14.arn
    instance_id           = aws_instance.troy-project14.id
    vpc_security_group_ids = aws_instance.troy-project14.vpc_security_group_ids
    instance_public_ip    = aws_instance.troy-project14.public_ip
  }
}

resource "local_file" "outputs_to_yaml" {
  content  = yamlencode(local.output_data)
  filename = "${path.module}/my-playbook/roles/vars/instance_vars.yml"
}
