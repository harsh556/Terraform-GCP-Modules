ilb_config = {
  ilb1 = {
    project_id = "searce-playground-v2"
    region     = "asia-south1"
    name       = "shiv-ilb"
    vpc_config = {
      network    = "projects/searce-playground-v2/global/networks/common-cloud-engg-vpc"
      subnetwork = "projects/searce-playground-v2/regions/asia-south1/subnetworks/common-cloud-engg-vpc"
    }
    description = "Internal Load Balancer for my application"
    backend_service_config = {
      protocol         = "TCP"
      session_affinity = "NONE"
      timeout_sec      = 30
    }
    
    backends = [
      {
        group       = "projects/searce-playground-v2/zones/asia-south1-b/instanceGroups/av-mig"
        description = "Backend instance group"
        failover    = false
      }
    ]
    forwarding_rules_config = {
      "" = {
        ports         = ["80"]
        global_access = true
      }
    }
  
    health_check_config = {
      tcp = {
        port_specification = "USE_SERVING_PORT"
      }
    }
    labels = {
      environment = "test"
      team        = "init"
    }
    service_attachments = {
      "rule1" = {
        nat_subnets           = ["projects/searce-playground-v2/regions/asia-south1/subnetworks/common-cloud-engg-vpc"]
        automatic_connection  = true
        consumer_accept_lists = {
          "consumer-project" = 10
        }
        enable_proxy_protocol = false
      }
    }
    service_label = "ilb-service"
  }
}