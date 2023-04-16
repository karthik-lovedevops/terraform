variable "cluster_name" {
  
}

variable "opensearch_version" {
  
}

variable "instance_type" {
  
}

variable "dedicated_master_enabled" {
    type = bool
}

variable "dedicated_master_count" {
   type = number
}

variable "dedicated_master_type" {
  type = string
}

variable "instance_count" {
  type = number
}

variable "volume_size" {
  type = number
}

variable "access_policy" {
  type = string
}

variable "default_policy_for_fine_grained_access_control" {
  type = string
}