locals {
  common_name_suffix = "${var.project_name}-${var.environment}" # roboshop-dev
  mongodb_sg_id = data.aws_ssm_parameter.mongodb_sg_id.value
  redis_sg_id = data.aws_ssm_parameter.redis_sg_id.value
  rabbitmq_sg_id = data.aws_ssm_parameter.rabbitmq_sg_id.value
  mysql_sg_id = data.aws_ssm_parameter.mysql_sg_id.value
  database_subnet_id = split(",", data.aws_ssm_parameter.database_subnet_ids.value)[0]
  ami_id = data.aws_ami.joindevops.id
  database_private_ips = {
    mongodb  = aws_instance.mongodb.private_ip
    redis    = aws_instance.redis.private_ip
    mysql    = aws_instance.mysql.private_ip
    rabbitmq = aws_instance.rabbitmq.private_ip
}
  common_tags = {
    project = var.project_name
    environment = var.environment
    Terraform = "true"
  }
}