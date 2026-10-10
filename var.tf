variable env {
  type        = string
}

variable vpc_cidr {
  type        = string
}

variable public_subnet_1_cidr {
  type        = string
}

variable public_subnet_2_cidr {
  type        = string
}

variable private_subnet_1_cidr {
  type        = string
}

variable private_subnet_2_cidr {
  type        = string
}


variable map_public_ip_on_launch {
  type        = bool
  default     = true
}

variable from_port   {
  type        = number
}

variable to_port     {
  type        = number
}


variable ip_protocol    {
  type        = string
}

