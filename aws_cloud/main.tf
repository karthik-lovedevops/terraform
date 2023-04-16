# module "aws_opensearch" {
#   source = "./custom_modules/Opensearch"
#   cluster_name = "bi_mon"
#   opensearch_version = "OpenSearch_1.0"
#   instance_type = "t3.small.search"
#   dedicated_master_enabled = false
#   dedicated_master_count = 0
#   dedicated_master_type = null
#   instance_count = 1
#   volume_size = 10
#   default_policy_for_fine_grained_access_control = true
#   access_policy = null

# }

# module "aws_opensearch2" {
#   source = "./custom_modules/Opensearch"
#   cluster_name = "es2"
#   opensearch_version = "OpenSearch_1.0"
#   instance_type = "t3.small.search"
# }