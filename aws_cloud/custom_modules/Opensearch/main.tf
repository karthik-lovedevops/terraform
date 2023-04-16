resource "aws_opensearch_domain" "bi_opensearch" {
  domain_name = var.cluster_name
  engine_version = var.opensearch_version

  cluster_config {
    instance_type = var.instance_type
    dedicated_master_enabled = try(var.dedicated_master_enabled, false)
    dedicated_master_count = try(var.dedicated_master_count, 0)
    dedicated_master_type = try(var.dedicated_master_type,"t2.small.elasticsearch")
    instance_count = try(var.instance_count, 1)
  }

    advanced_security_options {
    enabled                        = true
    internal_user_database_enabled = true
    master_user_options {
      master_user_name     = "esadmin"
      master_user_password = "Barbarbarbar1!"
    }
  }

  encrypt_at_rest {
    enabled = true
  }

  domain_endpoint_options {
    enforce_https       = true
    tls_security_policy = "Policy-Min-TLS-1-2-2019-07"
  }

  node_to_node_encryption {
    enabled = true
  }

  ebs_options {
    ebs_enabled = true
    volume_size = var.volume_size
  }

access_policies = var.access_policy == null && var.default_policy_for_fine_grained_access_control ? (<<CONFIG
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Action": "es:*",
                "Principal": {
                  "AWS": "*"
                  },
                "Effect": "Allow",
                "Resource": "*"
            }
        ]
    }
    CONFIG 
  ) : var.access_policy
}