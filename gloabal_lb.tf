module "lb-http" {
  source            = "GoogleCloudPlatform/lb-http/google//modules/serverless_negs"
  version           = "~> 9.0"

  project           = var.project_id
  name              = "${var.service_name}-lb"

  ssl                             = true
  managed_ssl_certificate_domains = var.certificate_domains
  https_redirect                  = true
  security_policy                 = module.security_policy.policy.id
  backends = {
    default = {
      protocol                        = "HTTP"
      port_name                       = var.service_port_name
      enable_cdn                      = false


      log_config = {
        enable = true
        sample_rate = 1.0
      }

      groups = local.groups

      iap_config = {
        enable               = false
      }

      outlier_detection = {
        outlier_detection = {
          seconds = 10
        }
        interval = {
          seconds = 10
        }
        consecutive_errors = 5
        max_ejection_percent = 50
      }
    }
  }
}
