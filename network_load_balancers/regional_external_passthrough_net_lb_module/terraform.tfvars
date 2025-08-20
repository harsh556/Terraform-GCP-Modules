enable_net_lb_creation = true


net-lb-ext = {
  "nlb-ext1" = {
    project_id   = ""
    region       = ""
    name         = ""
    # description  = "This is the description for the same"
    health_check = "projects/{project_id}/regions/{region}/healthChecks/{healthcheck_name}"
    labels = {
      "env"        = "dev"
      "created-by" = "terraform"
    }

    backend_service_config = {
      # connection_draining_timeout_sec = ""
      # connection_tracking = {
      #   idle_timeout_sec          = ""
      #   persist_conn_on_unhealthy = ""
      #   track_per_session         = ""
      # }
      # failover_config = {
      #   disable_conn_drain        = ""
      #   drop_traffic_if_unhealthy = ""
      #   ratio                     = ""
      # }
      # locality_lb_policy = ""
      # name               = ""
      # port_name          = ""
      # log_sample_rate    = ""
      protocol           = "TCP"
      # session_affinity   = "none"
      # timeout_sec        = ""
    }


    backends = [
      {
        group       = "projects/{project_id}/zones/{zone}/instanceGroups/{ig_name}"
        failover    = false
        description = ""
      }
      # {
      #   group       = ""
      #   failover    = false
      #   description = ""
      # }
    ]

    forwarding_rules_config = {
    #   "rule1" = {
    #     # address     = ""
    #     # description = ""
    #     # ipv6        = ""
    #     name        = ""
    #     # ports       = ""
    #     # protocol    = ""
    #     subnetwork  = ""
    #   }
      # "rule2" = {
      #   address     = ""
      #   description = ""
      #   ipv6        = ""
      #   name        = ""
      #   ports       = ""
      #   protocol    = ""
      #   subnetwork  = ""
      # }
    }

    group_configs = {
      # "gc1" = {
        # zone      = "us-central1-c"
        # instances = [""]
        # named_ports = 
      # }
    }

        # group_configs = null
    # }


    health_check_config = {
      # check_interval_sec  = 5
      # description         = ""
      # enable_logging      = false
      # healthy_threshold   = 2
      # name                = "poc-rm-health-check"
      # timeout_sec         = 5
      # unhealthy_threshold = 2
      # http = {
        # host = 
        # port = 80
        # port_name = 
        # port_specification = "USE_SERVING_PORT"
        # proxy_header = 
        # request_path = "/"
        # response = 
      # }
    }
  }
}