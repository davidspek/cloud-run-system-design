provider "google" {
  project = var.project_id
  region  = var.run_regions[0]
}
