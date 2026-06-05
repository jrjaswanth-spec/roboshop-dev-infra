
##### MONGODB_SG RULES #####
resource "aws_security_group_rule" "mongodb_bastion" {
  type = "ingress"
  security_group_id = local.mongodb_sg_id
   source_security_group_id = local.bastion_sg_id
  from_port         = 22
  protocol       = "tcp"
  to_port           = 22
}

# catalogue connecting to mongodb
resource "aws_security_group_rule" "mongodb_catalogue" {
  type = "ingress"
  security_group_id = local.mongodb_sg_id
   source_security_group_id = local.catalogue_sg_id
  from_port         = 27017
  protocol       = "tcp"
  to_port           = 27017
}

resource "aws_security_group_rule" "mongodb_user" {
  type = "ingress"
  security_group_id = local.mongodb_sg_id
   source_security_group_id = local.user_sg_id
  from_port         = 27017
  protocol       = "tcp"
  to_port           = 27017
}

#### REDIS_SG RULES ####
resource "aws_security_group_rule" "redis_bastion" {
  type = "ingress"
  security_group_id = local.redis_sg_id
   source_security_group_id = local.bastion_sg_id
  from_port         = 22
  protocol       = "tcp"
  to_port           = 22
}


resource "aws_security_group_rule" "redis_user" {
  type = "ingress"
  security_group_id = local.redis_sg_id
  source_security_group_id = local.user_sg_id
  from_port         = 6379
  protocol       = "tcp"
  to_port           = 6379
}

resource "aws_security_group_rule" "redis_cart" {
  type = "ingress"
  security_group_id = local.redis_sg_id
  source_security_group_id = local.cart_sg_id
  from_port         = 6379
  protocol       = "tcp"
  to_port           = 6379
}

#### MYSQL_SG RULES ####
resource "aws_security_group_rule" "mysql_bastion" {
  type = "ingress"
  security_group_id = local.mysql_sg_id
   source_security_group_id = local.bastion_sg_id
  from_port         = 22
  protocol       = "tcp"
  to_port           = 22
}

resource "aws_security_group_rule" "mysql_shipping" {
  type = "ingress"
  security_group_id = local.mysql_sg_id
  source_security_group_id = local.shipping_sg_id
  from_port = 3306
  protocol  = "tcp"
  to_port   = 3306
}

#### RABBITMQ_SG RULES ####
resource "aws_security_group_rule" "rabbitmq_bastion" {
  type = "ingress"
  security_group_id = local.rabbitmq_sg_id
   source_security_group_id = local.bastion_sg_id
  from_port         = 22
  protocol       = "tcp"
  to_port           = 22
}

resource "aws_security_group_rule" "rabbitmq_payment" {
  type = "ingress"
  security_group_id = local.rabbitmq_sg_id
  source_security_group_id = local.payment_sg_id
  from_port = 5672
  protocol  = "tcp"
  to_port   = 5672
}

#### CATALOGUE_SG RULES ####
resource "aws_security_group_rule" "catalogue_bastion" {
  type = "ingress"
  security_group_id = local.catalogue_sg_id
   source_security_group_id = local.bastion_sg_id
  from_port         = 22
  protocol       = "tcp"
  to_port           = 22
}


resource "aws_security_group_rule" "catalogue_backend_alb" {
  type = "ingress"
  security_group_id = local.catalogue_sg_id
   source_security_group_id = local.backend_alb_sg_id
  from_port         = 8080
  protocol       = "tcp"
  to_port           = 8080
}

#### USER_SG RULES ####
resource "aws_security_group_rule" "user_backend_alb" {
  type = "ingress"
  security_group_id = local.user_sg_id
  source_security_group_id = local.backend_alb_sg_id
  from_port = 8080
  protocol  = "tcp"
  to_port   = 8080
}


resource "aws_security_group_rule" "user_bastion" {
  type = "ingress"
  security_group_id = local.user_sg_id
  source_security_group_id = local.bastion_sg_id
  from_port = 22
  protocol  = "tcp"
  to_port   = 22
}

resource "aws_security_group_rule" "bastion_laptop" {
  type = "ingress"
  security_group_id = local.bastion_sg_id
  cidr_blocks = ["0.0.0.0/0"]
  from_port         = 22
  protocol       = "tcp"
  to_port           = 22
}

# frontend shhould accept connections from public
resource "aws_security_group_rule" "frontend_alb_public" {
  type              = "ingress"
  security_group_id = local.frontend_alb_sg_id
  cidr_blocks = ["0.0.0.0/0"]
  from_port         = 443
  protocol          = "tcp"
  to_port           = 443
}


resource "aws_security_group_rule" "cart_backend_alb" {
  type = "ingress"
  security_group_id = local.cart_sg_id
  source_security_group_id = local.backend_alb_sg_id
  from_port = 8080
  protocol  = "tcp"
  to_port   = 8080
}
#### PAYMENT_SG RULES ####
resource "aws_security_group_rule" "payment_bastion" {
  type = "ingress"
  security_group_id = local.payment_sg_id
  source_security_group_id = local.bastion_sg_id
  from_port = 22
  protocol  = "tcp"
  to_port   = 22
}

resource "aws_security_group_rule" "payment_backend_alb" {
  type = "ingress"
  security_group_id = local.payment_sg_id
  source_security_group_id = local.backend_alb_sg_id
  from_port = 8080
  protocol  = "tcp"
  to_port   = 8080
}

#### SHIPPING_SG RULES ###

resource "aws_security_group_rule" "shipping_backend_alb" {
  type = "ingress"
  security_group_id = local.shipping_sg_id
  source_security_group_id = local.backend_alb_sg_id
  from_port = 8080
  protocol  = "tcp"
  to_port   = 8080
}

resource "aws_security_group_rule" "shipping_bastion" {
  type = "ingress"
  security_group_id = local.shipping_sg_id
  source_security_group_id = local.bastion_sg_id
  from_port = 22
  protocol  = "tcp"
  to_port   = 22
}


resource "aws_security_group_rule" "cart_bastion" {
  type = "ingress"
  security_group_id = local.cart_sg_id
  source_security_group_id = local.bastion_sg_id
  from_port = 22
  protocol  = "tcp"
  to_port   = 22
}

#### BACKEND ALB RULES
resource "aws_security_group_rule" "backend_alb_frontend" {
  type = "ingress"
  security_group_id = local.backend_alb_sg_id
  source_security_group_id = local.frontend_sg_id
  from_port = 80
  protocol  = "tcp"
  to_port   = 80
}

resource "aws_security_group_rule" "backend_alb_bastion" {
  type = "ingress"
  security_group_id = local.backend_alb_sg_id # frontend SG ID
  source_security_group_id =  local.bastion_sg_id # front-end-ALB sg id
  from_port         = 80
  protocol       = "tcp"
  to_port           = 80
}

resource "aws_security_group_rule" "backend_alb_cart" {
  type = "ingress"
  security_group_id = local.backend_alb_sg_id # frontend SG ID
  source_security_group_id =  local.cart_sg_id # front-end-ALB sg id
  from_port         = 80
  protocol       = "tcp"
  to_port           = 80
}

resource "aws_security_group_rule" "backend_alb_shipping" {
  type              = "ingress"
  security_group_id = local.backend_alb_sg_id
  source_security_group_id = local.shipping_sg_id
  from_port         = 80
  protocol          = "tcp"
  to_port           = 80
}

resource "aws_security_group_rule" "backend_alb_payment" {
  type              = "ingress"
  security_group_id = local.backend_alb_sg_id
  source_security_group_id = local.payment_sg_id
  from_port         = 80
  protocol          = "tcp"
  to_port           = 80
}


### FRONTEND RULES ###
resource "aws_security_group_rule" "frontend_frontend_alb" {
  type = "ingress"
  security_group_id = local.frontend_sg_id
  source_security_group_id = local.frontend_alb_sg_id
  from_port = 80
  protocol  = "tcp"
  to_port   = 80
}

resource "aws_security_group_rule" "frontend_bastion" {
  type = "ingress"
  security_group_id = local.frontend_sg_id
  source_security_group_id = local.bastion_sg_id
  from_port = 22
  protocol  = "tcp"
  to_port   = 22
}

### VPN RULE ###
resource "aws_security_group_rule" "openvpn_public" {
  type = "ingress"
  security_group_id = local.openvpn_sg_id
  cidr_blocks = ["0.0.0.0/0"]
  from_port = 22
  protocol  = "tcp"
  to_port   = 22
}

resource "aws_security_group_rule" "openvpn_943" {
  type              = "ingress"
  security_group_id = local.openvpn_sg_id
  cidr_blocks = ["0.0.0.0/0"]
  from_port         = 943
  protocol          = "tcp"
  to_port           = 943
}

resource "aws_security_group_rule" "openvpn_443" {
  type              = "ingress"
  security_group_id = local.openvpn_sg_id
  cidr_blocks = ["0.0.0.0/0"]
  from_port         = 443
  protocol          = "tcp"
  to_port           = 443
}

resource "aws_security_group_rule" "openvpn_1194" {
  type              = "ingress"
  security_group_id = local.openvpn_sg_id
  cidr_blocks = ["0.0.0.0/0"]
  from_port         = 1194
  protocol          = "tcp"
  to_port           = 1194
}

resource "aws_security_group_rule" "components_vpn" {
  for_each = local.vpn_ingress_rules
  type              = "ingress"
  security_group_id = each.value.sg_id
  source_security_group_id = local.openvpn_sg_id
  from_port         = each.value.port
  protocol          = "tcp"
  to_port           = each.value.port
}


# components in backend cant talk with each other, they have to connect first with backend ALB first

# resource "aws_security_group_rule" "cart_shipping" {
#   type = "ingress"
#   security_group_id = local.cart_sg_id
#   source_security_group_id = local.shipping_sg_id
#   from_port = 8080
#   protocol  = "tcp"
#   to_port   = 8080
# }

# resource "aws_security_group_rule" "cart_payment" {
#   type = "ingress"
#   security_group_id = local.cart_sg_id
#   source_security_group_id = local.payment_sg_id
#   from_port = 8080
#   protocol  = "tcp"
#   to_port   = 8080
# }

# resource "aws_security_group_rule" "user_payment" {
#   type = "ingress"
#   security_group_id = local.user_sg_id
#   source_security_group_id = local.payment_sg_id
#   from_port = 8080
#   protocol  = "tcp"
#   to_port   = 8080
# }

# cart cannot connect to catalogue directly , it should be through backend ALB, this rules is wrong
# resource "aws_security_group_rule" "catalogue_cart" {
#   type = "ingress"
#   security_group_id = local.catalogue_sg_id
#   source_security_group_id = local.cart_sg_id
#   from_port = 8080
#   protocol  = "tcp"
#   to_port   = 8080
# }
