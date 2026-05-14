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
     # bastian
     ,"bastain"
     # frontend load balancer
     ,"frontend-lb"
     ]  
}