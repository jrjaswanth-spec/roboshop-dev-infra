variable "project_name" {
    default = "roboshop"
}

variable "environment" {
    default = "dev"
}

variable "sg_names" {
 default = [
    # databases
    "mongodb", "redis", "rabbitmq", "mysql"
    
    # backend
    ,"catalogue" , "user", "cart" , "shipping" , "payment"
     # frontend
     ,"frontend"
     # bastion
     ,"bastion"
     # frontend load balancer
     ,"frontend_alb"
     # backend alb
     ,"backend_alb"
     ]  
}

variable "zone_id" {
    default = "Z00835102KF6ZT3AHQVW7"
    type = string
  
}

variable "domain_name" {
    default = "jrdaws.life"
  
}