locals {
  groups = [for neg in google_compute_region_network_endpoint_group.default : {
    group = neg.id
  }]
}
