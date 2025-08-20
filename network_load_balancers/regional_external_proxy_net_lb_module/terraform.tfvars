tcp_proxy_lb_config = {
  tcp_lb1 = {
    name            = "shiv-tcp-proxy-lb"
    project         = "searce-playground-v2"
    network_project = "searce-playground-v2"
    region          = "asia-south1"
    network         = "projects/searce-playground-v2/global/networks/ravi-vpc"
    port_front_end  = 80
    backend = {
      backend_type = "INSTANCE_GROUP"
      port_name    = "http"
      groups = [
        {
          group           = "projects/searce-playground-v2/zones/asia-south1-c/instanceGroups/init-grp"
          balancing_mode  = "UTILIZATION"
          capacity_scaler = 1
        }
      ]
      log_config = {
        enable      = true
        sample_rate = 1.0
      }
    }
    health_check = {
      check_interval_sec  = 5
      healthy_threshold   = 2
      timeout_sec         = 5
      unhealthy_threshold = 2
      tcp_health_check = {
        port_specification = "USE_SERVING_PORT"
      }
    }
    create_firewall_rules    = true
    target_tags              = ["allow-tcp-lb"]
    create_proxy_only_subnet = true
    proxy_only_subnet_cidr   = "172.20.0.0/24" // in a region only one proxy only subent allowed
    proxy_header             = "NONE"
  }
}
