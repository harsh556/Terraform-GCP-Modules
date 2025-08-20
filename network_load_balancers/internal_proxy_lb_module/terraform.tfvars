net_lb_proxy_int_config = {
  ilb1 = {
    project_id = "searce-playground-v2"
    region     = "asia-south1"
    name       = "shiv-ilb"
    vpc_config = {
      network    = "projects/searce-playground-v2/global/networks/common-cloud-engg-vpc"
      subnetwork = "projects/searce-playground-v2/regions/asia-south1/subnetworks/common-cloud-engg-vpc"
    }
    description = "Internal Load Balancer for my application"
    address     = "10.160.11.1"
    global_access = true
    backend_service_config = {
      protocol         = "TCP"
      session_affinity = "CLIENT_IP"
      timeout_sec      = 30
      backends = [{
        group = "group1"
      }]
    }
    group_configs = {
      "group1" = {
        zone        = "asia-south1-c"
        instances   = ["projects/searce-playground-v2/zones/asia-south1-c/instances/init-testing2"]
        named_ports = {
          http = 80
        }
      }
    }
    health_check_config = {
      tcp = {
        port_specification = "USE_SERVING_PORT"
      }
    }
    labels = {
      environment = "production"
      team        = "devops"
    }
    neg_configs = {
      "neg1" = {
        gce = {
          zone        = "asia-south1-c"
          network     = "projects/searce-playground-v2/global/networks/common-cloud-engg-vpc"
          subnetwork  = "projects/searce-playground-v2/regions/asia-south1/subnetworks/harsh-subnet"
          endpoints   = {
            "endpoint1" = {
              instance   = "projects/searce-playground-v2/zones/asia-south1-c/instances/init-testing"
              ip_address = "10.0.0.33"
              port       = 80
            }
          }
        }
      }
    }
    port = 80
  }
}