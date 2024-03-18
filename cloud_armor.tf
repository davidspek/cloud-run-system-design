module security_policy {
  source                               = "GoogleCloudPlatform/cloud-armor/google"
  version                              = "~> 2.0"

  project_id                           = var.project_id
  name                                 = "${var.service_name}-ca-policy"
  description                          = "Cloud Armor security policy with preconfigured rules, security rules and custom rules"
  default_rule_action                  = "deny(403)"
  type                                 = "CLOUD_ARMOR"
  layer_7_ddos_defense_enable          = true
  layer_7_ddos_defense_rule_visibility = "STANDARD"
  json_parsing                         = "STANDARD"
  log_level                            = "VERBOSE"

  # pre_configured_rules                 = {}
  # security_rules                       = {}
  # custom_rules                         = {}
  # threat_intelligence_rules            = {}
  # adaptive_protection_auto_deploy      = {}
}
