resource "google_cloud_run_v2_service" "default" {
  count = length(var.run_regions)
  name     = "${var.service_name}-${var.run_regions[count.index]}"
  location = var.run_regions[count.index]
  # ingress = "INGRESS_TRAFFIC_ALL"

  template {
    containers {
      image = var.container_image
    }
  }
}

resource "google_compute_region_network_endpoint_group" "default" {
  count = length(var.run_regions)
  name     = "${var.service_name}-${var.run_regions[count.index]}-ng"
  region   = var.run_regions[count.index]

  network_endpoint_type = "SERVERLESS"
  cloud_run {
    service = google_cloud_run_v2_service.default[count.index].name
  }
}
